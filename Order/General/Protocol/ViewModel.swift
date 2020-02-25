



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
    
   
    var delegate:TableViewDelegate? { get set }
    
}


extension TableViewModel {
    
    
    
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




