//
//  TableViewDelegate.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit


protocol TableViewDelegate: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    var tableView: UITableView! {get set}
    func didDataUpdated()
    func didDateRequestFailed(error:Error?)
 
}


extension TableViewDelegate  {
    func didDataUpdated() {
        self.tableView.reloadData()
    }
    
    func didDateRequestFailed(error:Error?) {
        self.showAlert(title: "cannot get data", message: error?.localizedDescription)
    }
}





