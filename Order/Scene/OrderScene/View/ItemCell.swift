//
//  ItemCell.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell, ViewModelBinded {

    
    @IBOutlet weak var adjustButton: UIButton!
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    @IBOutlet weak var unitLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
   
   
    @IBAction func adjust(_ sender: Any) {
        viewModel?.adjust()
    }
    
    
    var viewModel: ItemCellViewModel? {
        didSet {
            self.configure()
        }
    }
    
    
    
    func configure() {
        guard let item = viewModel?.item, let viewModel = viewModel else {return}
        itemTitleLabel.text = item.name
        quantityLabel.text = String(item.quantity)
        unitLabel.text = item.spec
        adjustButton.isHidden = viewModel.isSigned
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
