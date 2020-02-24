//
//  ItemViewController.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-24.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController,OrderSceneVC, ViewModelBinded {
    var viewModel: ItemViewModel?
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemTitleLabel.text = viewModel?.itemTitle
        refreshQuantity()
        // Do any additional setup after loading the view.
    }
    
    func refreshQuantity() {
        self.quantityLabel.text = viewModel?.quantityText
    }
    
    @IBAction func decreaseQuantity(_ sender: Any) {
        viewModel?.decreaseQuantity()
        refreshQuantity()
    }
    
    @IBAction func addQuantity(_ sender: Any) {
        viewModel?.addQuantity()
        refreshQuantity()
    }
    
    @IBAction func saveQuantity(_ sender: Any) {
        viewModel?.saveAdjustment()
        
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        viewModel?.deleteItem()
        
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
