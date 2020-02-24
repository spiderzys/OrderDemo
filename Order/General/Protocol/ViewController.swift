
import UIKit

protocol ViewModelBinded:UIViewController {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType? {get set}
  
}

protocol ViewModelRequestDelegate:AnyObject {
    func requestCompleted(error:Error?)
}

extension ViewModelRequestDelegate where Self: UIViewController {
    
    func requestCompleted(error:Error?) {
        if let error = error {
            self.showAlert(title: nil, message: error.localizedDescription)
        }
        
    }
}
