

import Foundation
import UIKit

class Constant {
    
    class func showAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static let kGoogleDirectionAPI = "AIzaSyBn9JDmqFJIM3QbVs3GOzm3R9SQ9C_6aiU"
    static let alertTitle = "Restaurant App"
}
