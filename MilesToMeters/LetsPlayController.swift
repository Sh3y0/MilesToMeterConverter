//
//  LetsPlayController.swift
//  MilesToMeters
//
//  Created by Eliseo_Martinez on 7/3/18.
//  Copyright © 2018 doodle-software. All rights reserved.
//

import UIKit

class LetsPlayController: UIViewController {
    //
    //properties
    @IBOutlet var txtFingers: UITextField!
    @IBOutlet var cpuFingers: UILabel!
    

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

    @IBAction func guessFingers(_ sender: Any) {
        var aleatorio = ""

        let num:Int = Int(arc4random_uniform(5))
        
        if txtFingers.text != "" {
            
            switch (num){
            case 1:
                aleatorio = "☝🏻"
                break
            case 2:
                aleatorio = "✌🏻"
                break
            case 3:
                aleatorio = "3️⃣"
                break
            case 4:
                aleatorio = "4️⃣"
                break
            case 5:
                aleatorio = "🖐🏻"
                break
            default:
                aleatorio = "0"
                break
            }
            cpuFingers.text = aleatorio
            
            
            if Int(txtFingers.text!)! == num{
                let alertControler : UIAlertController = UIAlertController(title: "Exito 👏🏻", message: "Adivinaste", preferredStyle: .alert)
                
                let closeAlert : UIAlertAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
                
                alertControler.addAction(closeAlert)
                
                present(alertControler, animated: true, completion: nil)
            }else{
                let alertControler : UIAlertController = UIAlertController(title: "☹️", message: "Sigue intentando!!", preferredStyle: .alert)
                
                let closeAlert : UIAlertAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
                
                alertControler.addAction(closeAlert)
                
                present(alertControler, animated: true, completion: nil)
            }
            
        }else{
            let alertControler : UIAlertController = UIAlertController(title: "Error", message: "Favor ingresar un valor", preferredStyle: .alert)
            
            let closeAlert : UIAlertAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
            
            alertControler.addAction(closeAlert)
            
            present(alertControler, animated: true, completion: nil)
        }
    }
}
