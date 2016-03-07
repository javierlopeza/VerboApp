//
//  HorarioWebViewController.swift
//  Verbo Tabs
//
//  Created by Javier López Achondo on 04-01-16.
//  Copyright © 2016 Javier López Achondo. All rights reserved.
//

import UIKit

class HorarioWebViewController: UIViewController {
    
    @IBOutlet weak var HorarioWebView: UIWebView!
    
    var url_string = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Colores y estilo
        navigationController?.navigationBar.barTintColor = UIColor(red: 3/255.0, green: 120/255.0, blue: 63/255.0, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barStyle = .BlackTranslucent
        
        // Mostrar horario
        let url = NSURL(string: url_string)
        let request = NSURLRequest(URL: url!)
        HorarioWebView.loadRequest(request)
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
