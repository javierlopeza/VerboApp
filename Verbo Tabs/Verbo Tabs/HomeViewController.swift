//
//  FirstViewController.swift
//  Verbo Tabs
//
//  Created by Javier López Achondo on 03-01-16.
//  Copyright © 2016 Javier López Achondo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var BGImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Imagen background random
        let imagenes = ["Cordillera", "Pista Atletismo", "Lluvia"]
        let index_elegida = Int(arc4random_uniform(UInt32(imagenes.count)))
        BGImage.image = UIImage(named: imagenes[index_elegida])
        
        // Colores y estilo
        navigationController?.navigationBar.barTintColor = UIColor(red: 3/255.0, green: 120/255.0, blue: 63/255.0, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barStyle = .BlackTranslucent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

