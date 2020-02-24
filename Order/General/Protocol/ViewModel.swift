



import UIKit

protocol ViewModel {
    associatedtype coordinatorType:Coordinator
    var coordinator: coordinatorType? {get set}
    
}


protocol TableViewModel: ViewModel {
    associatedtype ObjectType: Any
    func object(in indexPath:IndexPath) -> ObjectType?
    func objectCount(in section:Int) -> Int
    var sectionSize: Int {get}
    
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
    
    func cellViewModel<T:SingleSectionCellViewModel>(on indexPath: IndexPath) -> T? where T.ObjectType == ObjectType, T.coordinatorType == coordinatorType {
        guard let object = self.object(in: indexPath) else {return nil}
        var viewModel = T(object: object)
        viewModel.coordinator = self.coordinator
        return viewModel
    }
    
}



protocol SingleSectionTableViewModel: TableViewModel {
   // associatedtype ObjectType: Any
    var objectList:[ObjectType] {get}
}

extension SingleSectionTableViewModel {
    var sectionSize: Int {
        return 1
    }
    func objectCount(in section:Int) -> Int{
        return objectList.count
    }
    
    func object(in indexPath:IndexPath) -> ObjectType? {
        guard indexPath.row < objectList.count else {return nil}
        return objectList[indexPath.row]
    }
    
    
    
    
}

protocol SingleSectionCellViewModel: NSObject, ViewModel {
    associatedtype ObjectType: Any
    var object:ObjectType {get}
    init(object:ObjectType)
}

extension SingleSectionCellViewModel {
   // init(object:ObjectType) {
   //     self.object = object
  //  }
}



