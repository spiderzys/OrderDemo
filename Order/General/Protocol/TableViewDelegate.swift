//
//  TableViewDelegate.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit


protocol TableViewDelegate: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewModelRequestDelegate {
 
    var tableView: UITableView! {get set}
    
 
}

extension TableViewDelegate {
    func requestCompleted(error:Error?) {
        if let error = error {
            self.showAlert(title: nil, message: error.localizedDescription)
        }
        else {
            self.tableView.reloadData()
        }
        
    }
}






