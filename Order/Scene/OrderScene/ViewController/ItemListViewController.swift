//
//  ItemListViewController.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class ItemListViewController: UITableViewController,OrderSceneVC, ViewModelBinded, TableViewDelegate {
    var viewModel: ItemListViewModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "order")
        tableView.tableFooterView = UIView()
        configureSign()
    }
    
    func configureSign() {
        if viewModel?.isSigned == true {
            self.navigationItem.rightBarButtonItems = []
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.requestOrder()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         return viewModel?.objectList.count ?? 0
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "order", for: indexPath) as? ItemCell, let viewModel = viewModel else {return UITableViewCell()}
        cell.viewModel = viewModel.cellViewModel(on: indexPath)
        cell.viewModel?.isSigned = viewModel.isSigned
        return cell
     }
     
    
     
     override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return CGFloat.leastNonzeroMagnitude
     }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
     
    
    
    @IBAction func sign(_ sender: Any) {
        viewModel?.sign()
    }
    
    
    deinit {
        print(self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
