//
//  DivisasController.swift
//  MilesToMeters
//
//  Created by Eliseo_Martinez on 7/3/18.
//  Copyright © 2018 doodle-software. All rights reserved.
//

import UIKit

class DivisasController: UIViewController {
    //
    //properties
    @IBOutlet var fromMoney: UISegmentedControl!
    @IBOutlet var toMoney: UISegmentedControl!
    @IBOutlet var fromValue: UITextField!
    @IBOutlet var toVAlue: UILabel!
    
    let euro_dolar = 1.17
    let euro_libras = 0.89
    let euro_reales = 4.56
    let dolar_libras = 0.76
    let dolar_reales = 3.91
    let libras_reales = 5.15
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func evalueta(_ sender: Any) {
        if fromValue.text == "" {
            let alertControler : UIAlertController = UIAlertController(title: "Error", message: "Favor ingresar un valor", preferredStyle: .alert)
            
            let closeAlert : UIAlertAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
            
            alertControler.addAction(closeAlert)
            
            present(alertControler, animated: true, completion: nil)
        }else{
            let from = fromMoney.selectedSegmentIndex
            let to = toMoney.selectedSegmentIndex
            let fromVal = Double(fromValue.text!)!
            
            let result = calculateDivisa(from: from, to: to, fromValue: fromVal)
            
            toVAlue.text = "Resultado : \(String(format: "%.4f", result))"
        }
    }
    
    func calculateDivisa(from : Int, to: Int, fromValue: Double) -> Double {
        var result =  00.00
        
        switch from {
        case 0:
            result = calculateFromEuro(to: to, fromValue: fromValue)
        case 1:
            result = calculateFromDollars(to: to, fromValue: fromValue)
        case 2:
            result = calculateFromLibras(to: to, fromValue: fromValue)
        case 3:
            result = calculateFromReales(to: to, fromValue: fromValue)
        default:
            result = 00.00
        }
        
        return result
    }
    
    
    func calculateFromEuro(to: Int, fromValue: Double) -> Double{
        var result = 0.0
        switch to {
        case 0:
            result = fromValue * 1
        case 1:
            result = fromValue * euro_dolar
        case 2:
            result = fromValue * euro_libras
        case 3:
            result = fromValue * euro_reales
        default:
            result = 0.0
        }
        
        return result
    }
    
    func calculateFromDollars(to: Int, fromValue: Double) -> Double{
        var result = 0.0
        switch to {
        case 0:
            result = fromValue / euro_dolar 
        case 1:
            result = fromValue * 1
        case 2:
            result = fromValue * dolar_libras
        case 3:
            result = fromValue * dolar_reales
        default:
            result = 0.0
        }
        
        return result
    }
    
    func calculateFromLibras(to: Int, fromValue: Double) -> Double{
        var result = 0.0
        switch to {
        case 0:
            result = fromValue / euro_libras
        case 1:
            result = fromValue / dolar_libras
        case 2:
            result = fromValue * 1
        case 3:
            result = fromValue * libras_reales
        default:
            result = 0.0
        }
        
        return result
    }
    
    func calculateFromReales(to: Int, fromValue: Double) -> Double{
        var result = 0.0
        switch to {
        case 0:
            result = fromValue / euro_reales
        case 1:
            result = fromValue / dolar_reales
        case 2:
            result = fromValue / libras_reales
        case 3:
            result = fromValue * 1
        default:
            result = 0.0
        }
        
        return result
    }
}
