



import UIKit

protocol ViewModel {
    associatedtype coordinatorType:Coordinator
    var coordinator: coordinatorType? {get set}
}


protocol TableViewModel: ViewModel {
    func updateList()
    func updateFailed(error:Error?)
    var delegate:TableViewDelegate? { get set }
    
}


extension TableViewModel {
    func updateList() {
        delegate?.didDataUpdated()
    }
    func updateFailed(error:Error?) {
        delegate?.didDateRequestFailed(error: error)
    }
    
    func updateRequestCompleted(error:Error?) {
        if let error = error {
            delegate?.didDateRequestFailed(error: error)
        }
        else {
            delegate?.didDataUpdated()
        }
    }
    
}

protocol SingleSectionTableViewModel: TableViewModel {
    associatedtype objectType: Any
    var objectList:[objectType] {get}
}

extension SingleSectionTableViewModel {
    func objectCount(in section:Int) -> Int{
        return objectList.count
    }
    
    func object(in indexPath:IndexPath) -> objectType? {
        guard indexPath.row < objectList.count else {return nil}
        return objectList[indexPath.row]
    }
    
}
