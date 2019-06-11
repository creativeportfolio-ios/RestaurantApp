    
import Foundation

typealias CompletionBlock = (_ success: Bool, _ response: Any?) -> Void

class RestaurantListManager {
        
    static let shared = RestaurantListManager()
    
    func searchRestaurant(router: RestaurantRouter, completion: @escaping CompletionBlock) {
        NetworkManager.makeRequest(router) { (result) in
            switch result {
            case .success(let value):
                var restaurantModels: [RestaurantListModel] = []
                var nextPageToken: String = ""
                
                if let jsonResult = value as? [String : Any] {
                    if let objects = jsonResult["results"] as? [[String: Any]] {
                        for object in objects {
                            let giphyobject = RestaurantListModel(jsonData: object)
                            restaurantModels.append(giphyobject)
                        }
                    }
                
                    if let token = jsonResult["next_page_token"] as? String {
                        nextPageToken = token
                    }
                }
                completion(true, (restaurantModels, nextPageToken))
                
            case .failure(let error):
                completion(false, error)
            }
        }
    }
    
    func searchRestaurantWithkey(router: RestaurantRouter, completion: @escaping CompletionBlock) {
        NetworkManager.makeRequest(router) { (result) in
            switch result {
            case .success(let value):
                var restaurantModels: [RestaurantListModel] = []
                var nextPageToken: String = ""
                
                if let jsonResult = value as? [String : Any] {
                    if let objects = jsonResult["results"] as? [[String: Any]] {
                        for object in objects {
                            let giphyobject = RestaurantListModel(jsonData: object)
                            restaurantModels.append(giphyobject)
                        }
                    }
                    
                    if let token = jsonResult["next_page_token"] as? String {
                        nextPageToken = token
                    }
                }
                completion(true, (restaurantModels, nextPageToken))
                
            case .failure(let error):
                completion(false, error)
            }
        }
    }
}
