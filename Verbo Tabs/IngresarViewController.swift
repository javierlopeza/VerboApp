//
//  IngresarViewController.swift
//  Verbo Tabs
//
//  Created by Javier López Achondo on 03-01-16.
//  Copyright © 2016 Javier López Achondo. All rights reserved.
//

import UIKit

class IngresarViewController: UIViewController {

    @IBOutlet var IngresarWeb: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Colores y estilo
        navigationController?.navigationBar.barTintColor = UIColor(red: 3/255.0, green: 120/255.0, blue: 63/255.0, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barStyle = .BlackTranslucent
        
        // Cargar pagina ingreso
        let url = NSURL(string: "http://www.cvd.cl/")
        let request = NSURLRequest(URL: url!)
        IngresarWeb.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
