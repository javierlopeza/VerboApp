//
//  ViewController.swift
//  Verbo
//
//  Created by Javier López Achondo on 24-12-15.
//  Copyright © 2015 Javier López Achondo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Etiqueta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Boton(sender: AnyObject) {
        
        if Etiqueta.text == "Hola!" {
            Etiqueta.text = "Chao!"
        }
        else {
            Etiqueta.text = "Hola!"
        }
        
        
        
        
    }

}

