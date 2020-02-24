//
//  ViewModelBinded.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-24.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

protocol ViewModelBinded {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType? {get set}
  
}

