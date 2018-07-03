//
//  ViewController.swift
//  MilesToMeters
//
//  Created by Eliseo_Martinez on 7/2/18.
//  Copyright © 2018 doodle-software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //
    //properties
    @IBOutlet var txtValue: UITextField!
    @IBOutlet var scOptions: UISegmentedControl!
    @IBOutlet var lblResult: UILabel!
    
    /*override var prefersStatusBarHidden: Bool {
        return true
    }*/
    
    let unitMiles : Double = 1.609
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        if scOptions.selectedSegmentIndex == 0{
            lblResult.text = "00.00 M"
            txtValue.placeholder = "00.00 Km"
        }else{
            lblResult.text = "00.00 Km"
            txtValue.placeholder = "00.00 M"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    //actions
    @IBAction func procesResult(_ sender: Any) {
        convertResult()
    }

    @IBAction func changeType(_ sender: Any) {
        if scOptions.selectedSegmentIndex == 0{
            lblResult.text = "00.00 M"
            txtValue.placeholder = "00.00 Km"
        }else{
            lblResult.text = "00.00 Km"
            txtValue.placeholder = "00.00 M"
        }
    }
    
    func convertResult() {
        let selectedIndex = scOptions.selectedSegmentIndex
        
        if txtValue.text == "" {
            let alertControler : UIAlertController = UIAlertController(title: "Error", message: "Favor ingresar un valor", preferredStyle: .alert)
            
            let closeAlert : UIAlertAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
            
            alertControler.addAction(closeAlert)
            
            present(alertControler, animated: true, completion: nil)
        }else{
            let valueToProces : Double = Double(txtValue.text!)!
            
            if selectedIndex == 0 {
                let convertedValue = valueToProces / unitMiles
                lblResult.text = "\(String(format: "%.2f", convertedValue)) M"
            }else{
                let convertedValue = valueToProces * unitMiles
                lblResult.text = "\(String(format: "%.2f", convertedValue)) Km"
            }
        }
    }
}

