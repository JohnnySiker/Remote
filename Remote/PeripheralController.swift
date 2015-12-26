//
//  PeripheralController.swift
//  Remote
//
//  Created by Jonathan Velazquez on 25/12/15.
//  Copyright © 2015 Jonathan Velazquez. All rights reserved.
//

import UIKit
import CoreBluetooth

class PeripheraManagerlDelegate: NSObject,CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager) {
        
    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager, error: NSError?) {
        
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, didAddService service: CBService, error: NSError?) {
        
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, didReceiveReadRequest request: CBATTRequest) {
        
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, didReceiveWriteRequests requests: [CBATTRequest]) {
        
    }
    
}


class PeripheralController: UIViewController {

    @IBOutlet weak var btn_back: UIButton!
    var peripheral:CBPeripheralManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        startPeripheral()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    func setupView(){
        btn_back.layer.cornerRadius = 40
    }

    func startPeripheral(){
        
    }
    
    
    
    @IBAction func backToSelect(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
