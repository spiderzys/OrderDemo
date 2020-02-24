//
//  SignViewController.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-24.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class SignViewController: UIViewController,OrderSceneVC, ViewModelBinded {

    
    var viewModel: SignViewModel?
    
    @IBOutlet weak var canvas: Canvas!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sign(_ sender: Any) {
        if let image = canvas.signatureImage, canvas.signed {
            viewModel?.sign(image: image)
        }
    }
    
    
    @IBAction func clear(_ sender: Any) {
        canvas.clear()
    }
    
    @IBAction func cancel(_ sender: Any) {
        viewModel?.cancel()
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
