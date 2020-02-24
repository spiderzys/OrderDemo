//
//  RouteListViewController.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class RouteListViewController: UITableViewController,RouteSceneVC, ViewModelBinded, TableViewDelegate {
    
    
    var viewModel:RouteListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         viewModel?.requestRoute()
    }
    
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.objectList.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "route", for: indexPath) as? RouteListCell, let route = viewModel?.object(in: indexPath) else {return UITableViewCell()}
        cell.configure(route: route, action: {[weak self] in
            self?.showRoute(route: route)
        })
        
        return cell
    }
    
   

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let route = viewModel?.object(in: indexPath) {
            viewModel?.showOrder(on: route)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    
    func showRoute(route: CityRoute) {
        viewModel?.showRoute(route)
    }
   
}



