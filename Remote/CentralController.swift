//
//  CentralController.swift
//  Remote
//
//  Created by Jonathan Velazquez on 25/12/15.
//  Copyright © 2015 Jonathan Velazquez. All rights reserved.
//

import UIKit
import CoreBluetooth





class CentralController: UIViewController {
    
    
    @IBOutlet weak var tb_peripherals: UITableView!
    @IBOutlet weak var btn_back: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        setupView()
    }
    

    func setupView(){
        btn_back.layer.cornerRadius = 40
    }
    
    
    
    @IBAction func backToSelect(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func startToControl(sender: UIButton) {
        
    }
    
    
}
