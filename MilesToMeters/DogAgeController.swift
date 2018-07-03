//
//  DogAgeController.swift
//  MilesToMeters
//
//  Created by Eliseo_Martinez on 7/3/18.
//  Copyright © 2018 doodle-software. All rights reserved.
//

import UIKit

class DogAgeController: UIViewController {
    //
    //Properties
    @IBOutlet var txtDogAge: UITextField!
    @IBOutlet var lblResult: UILabel!
    
    let anoPerruno: Int = 7
    
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
    
    @IBAction func calculateAge(_ sender: Any) {
        if txtDogAge.text == ""{
            let alertControler : UIAlertController = UIAlertController(title: "Error", message: "Favor ingresar un valor", preferredStyle: .alert)
            
            let closeAlert : UIAlertAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
            
            alertControler.addAction(closeAlert)
            
            present(alertControler, animated: true, completion: nil)
        }else{
            let dogAge = Int(txtDogAge.text!)! * anoPerruno
            lblResult.text = "Tu 🐶 tiene \(dogAge) años"
        }
        
    }
}
