//
//  ItemViewModel.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-24.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class ItemViewModel: NSObject, ViewModel {
    weak var coordinator: OrderSceneCoordinator?
    weak var delegate: ViewModelRequestDelegate?
    var item:Item
    
    init(item: Item) {
        self.item = item
    }
    
    var itemTitle:String {
        return ("Order " + item.name + " (\(item.spec)) ")
    }
    
    var quantityText:String {
        return String(item.quantity)
    }
    
    func saveAdjustment() {
        OrderRepository.shared.updateItem(action: .update(item: item)) { (error) in
            self.delegate?.requestCompleted(error: error)
            if error == nil {
                self.coordinator?.back()
            }
        }
    }
    
    func deleteItem() {
        OrderRepository.shared.updateItem(action: .delete(item: item)) { (error) in
            self.delegate?.requestCompleted(error: error)
            if error == nil {
                self.coordinator?.back()
            }
        }
    }
    
    func addQuantity() {
        self.item.quantity += 1
        
    }
    
    func decreaseQuantity() {
        if item.quantity > 1 {
            self.item.quantity -= 1
        }
    }
}
