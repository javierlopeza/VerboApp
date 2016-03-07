//
//  ViewController.swift
//  JSON Reader
//
//  Created by Javier López Achondo on 26-12-15.
//  Copyright © 2015 Javier López Achondo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var InfoShow: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Lectura archivo JSON alumnos
        
        let path = NSBundle.mainBundle().pathForResource("alumnos", ofType: "json")
        
        let jsonData = NSData(contentsOfFile: path!)
        
        do {
            let jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions(rawValue: 0)) as? NSDictionary
            
            if jsonDict != nil {
                // JSON correcto
                
                InfoShow.text = "NOTAS POR ALUMNO\n"
                
                
                let lista_alumnos = jsonDict!["alumnos"] as! NSArray
                
                
                for alumno in lista_alumnos {
                    let nombres = alumno["nombres"] as! String
                    let apellido_paterno = alumno["apellido_paterno"] as! String
                    let apellido_materno = alumno["apellido_materno"] as! String
                    
                    InfoShow.text = InfoShow.text! + nombres + " " + apellido_paterno + " " + apellido_materno + "\n"
                    
                    let notas = alumno["notas"] as! NSDictionary
                    
                    for (asignatura, notas_asignatura) in notas {
                        InfoShow.text = InfoShow.text! + "\t" +  ((asignatura) as! String) + "\n"
                        for nota in (notas_asignatura as! NSArray) {
                            InfoShow.text = InfoShow.text! + "\t\t" + String(nota) + "\n"
                        }
                        InfoShow.text = InfoShow.text! + "\n"
                    }
                    InfoShow.text = InfoShow.text! + "\n"
                }
                
            } else {
                // JSON null
            }
        } catch let error as NSError {
            // error handling
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

