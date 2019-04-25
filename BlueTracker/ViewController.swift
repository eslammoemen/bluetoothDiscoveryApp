//
//  ViewController.swift
//  BlueTracker
//
//  Created by Eslam Moemen on 2/19/19.
//  Copyright © 2019 Eslam Moemen. All rights reserved.
//

import UIKit
import CoreBluetooth
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate {
    
    var centralManager : CBCentralManager?
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    //CBManager CODES
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Name\(peripheral.name)")
        print("RSSI:\(RSSI)")
        print("UIID:\(peripheral.identifier.uuid)")
        print("AD Data:\(advertisementData)")
    }
    
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
        //Working
            central.scanForPeripherals(withServices: nil, options: nil)
        }else{
            //Not Working
            let alert = UIAlertController(title: "Bluetooth Not Working", message: "Make Sure Bluetooth is working ", preferredStyle: .alert)
           let OKAction = UIAlertAction(title: "OK", style:.default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(OKAction)
            present(alert, animated: true, completion: nil)
        }
    }
    

    
    
   //TableView CODES
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "blueCell", for: indexPath) as? TableViewCell {
        cell.name.text = "Name"
        cell.RSS.text = "RSSI"
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        
        
        
        
        
    }
    

}

