//
//  RouteListCell.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class RouteListCell: UITableViewCell {

    var accessaryAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryView = MapButton.loadFromNib()
        // Initialization code
        
    }
    
    func configure(route: CityRoute, action: (() -> Void)?) {
        self.accessaryAction = route.signed ? nil : action
        self.detailTextLabel?.text = route.address
        self.textLabel?.text = route.name
        if let button = accessoryView as? MapButton {
            button.addTarget(self, action: #selector(showMap), for: .touchUpInside)
            button.frame = CGRect(origin: .zero, size: .init(width: 70, height: 30))
            button.configuraState(isSigned: route.signed)
           
        }
    }
    
    @objc func showMap() {
        accessaryAction?()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


  
}

