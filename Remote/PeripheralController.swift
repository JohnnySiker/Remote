//
//  PeripheralController.swift
//  Remote
//
//  Created by Jonathan Velazquez on 25/12/15.
//  Copyright © 2015 Jonathan Velazquez. All rights reserved.
//

import UIKit

class PeripheralController: UIViewController {

    @IBOutlet weak var btn_back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func setupView(){
        btn_back.layer.cornerRadius = 40
    }

    
    @IBAction func backToSelect(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
