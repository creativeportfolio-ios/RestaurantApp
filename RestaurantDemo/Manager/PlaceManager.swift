
import Foundation

typealias CompletionBlockPlaceManager = (_ success: Bool, _ response: Any?) -> Void

class PlaceManager {
    
    static let shared = PlaceManager()
    
    func searchPlacedetail(route: RestaurantRouter, completion: @escaping CompletionBlockPlaceManager) {
        NetworkManager.makeRequest(route) { (result) in
            switch result {
            case .success(let value):
                
                var placeDetailModel: PlaceDetailModel?
                if let jsonResult = value as? [String : Any], let objects = jsonResult["result"] as? [String: Any] {
                    placeDetailModel = PlaceDetailModel(jsonData: objects)
                }
                completion(true, placeDetailModel)
                
            case .failure(let error):
                completion(false, error)
            }
        }
    }
}

