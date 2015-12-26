//
//  CentralController.swift
//  Remote
//
//  Created by Jonathan Velazquez on 25/12/15.
//  Copyright © 2015 Jonathan Velazquez. All rights reserved.
//

import UIKit
import CoreBluetooth

class TableViewDelegate:NSObject,UITableViewDelegate {
    private var indexOfSelection:Int?
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        indexOfSelection = indexPath.row
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        indexOfSelection = nil
    }
    
    func getIndexOfCellSelected()-> Int?{
        return indexOfSelection
    }
    
}

class TableViewDataSource: NSObject,UITableViewDataSource {
    private var tableview:UITableView!
    private var cellTitles:[String] = []
    private var cellIndentifier:String!
    
    init(tableview:UITableView,cellTitles:[String],cellIndentifier:String) {
        self.tableview = tableview
        self.cellTitles = cellTitles
        self.cellIndentifier = cellIndentifier
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier(cellIndentifier)!
        cell.textLabel?.text = cellTitles[indexPath.row]
        setupCell(cell)
        return cell
    }
    
    func setupCell(cell: UITableViewCell){
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.textAlignment = .Center
    }
}

class CentralManagerDelegate: NSObject,CBCentralManagerDelegate {
    
    var peripheralsDiscovered:[CBPeripheral] = []
    
    var remoteServiceID:CBUUID!
    var characteristicIDs:[String:CBUUID]! = [:]
    
    init(remoteServiceID:CBUUID,characteristicIDs:[String:CBUUID]) {
       
        self.remoteServiceID = remoteServiceID
        self.characteristicIDs = characteristicIDs
    }
    
    
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        switch central.state {
        case .PoweredOn:
            central.scanForPeripheralsWithServices([remoteServiceID], options: nil)
            break
        case .PoweredOff:
            break
        case .Unsupported:
            break
        default:
            break
        }
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        if (peripheralsDiscovered.indexOf(peripheral) == nil) {
            peripheralsDiscovered.append(peripheral)
        }
    }
    
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        peripheral.discoverServices([remoteServiceID])
        central.stopScan()
    }
    
    func centralManager(central: CBCentralManager, didFailToConnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        
    }
    func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        peripheralsDiscovered = []
        central.scanForPeripheralsWithServices([remoteServiceID], options: nil)
    }
    
}

class PeripheralDelegate:NSObject,CBPeripheralDelegate {
    var remoteService:CBService!
    var remoteServiceID:CBUUID!
    var characteristicIDs:[String:CBUUID]! = [:]
    var characteristicAvailables:[CBCharacteristic] = []
    
    init(characteristicIDs:[String:CBUUID],remoteServiceID:CBUUID) {
        self.remoteServiceID = remoteServiceID
        self.characteristicIDs = characteristicIDs
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        for service in peripheral.services! {
            if service.UUID == remoteServiceID {
                remoteService = service
                peripheral.discoverCharacteristics(characteristicIDs.values.reverse(), forService: remoteService)
            }
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?) {
        if error == nil{
            characteristicAvailables = service.characteristics!
        }
        
    }
    
    func peripheral(peripheral: CBPeripheral, didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        
    }
    
    func peripheral(peripheral: CBPeripheral, didWriteValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        if error != nil {
            
        }
    }
    
    
}




class CentralController: UIViewController {
    
    
    @IBOutlet weak var tb_peripherals: UITableView!
    @IBOutlet weak var btn_back: UIButton!
    
    var central:CBCentralManager!
    var remoteServiceID:CBUUID!
    
    var tableDelegate:TableViewDelegate!
    var tableDataSource:TableViewDataSource!
    var centralManagerDelegate:CentralManagerDelegate!
    var peripheralDelegate:PeripheralDelegate!
    var characteristicIDs:[String:CBUUID]! = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        setupView()
        startingCentralManager()
    }
    

    func setupView(){
        btn_back.layer.cornerRadius = 40
    }
    
    func startingCentralManager(){
        remoteServiceID = CBUUID(string: <#T##String#>)
        
        
    centralManagerDelegate = CentralManagerDelegate(remoteServiceID: <#T##CBUUID#>, characteristicIDs: <#T##[String : CBUUID]#>)
        
        central = CBCentralManager(delegate: <#T##CBCentralManagerDelegate?#>, queue: <#T##dispatch_queue_t?#>, options: <#T##[String : AnyObject]?#>)
    }
    
    
    @IBAction func backToSelect(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func startToControl(sender: UIButton) {
        
    }
    
    
}
