//
//  CityListViewController.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class CityListViewController: UITableViewController, RouteSceneVC, ViewModelBinded, TableViewDelegate {
    
    @IBAction func signOut(_ sender: Any) {
        viewModel?.signOut()
    }
    
    
    var viewModel: CityListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.requestCity()
        
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.objectCount(in: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city", for: indexPath)
        cell.textLabel?.text = viewModel?.object(in: indexPath)?.name
        return cell
    }
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let city = viewModel?.object(in: indexPath) {
            viewModel?.showRoutes(in: city)
        }
    }
    
    deinit {
        print(self)
    }
   

}
