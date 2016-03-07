//
//  ContactosViewController.swift
//  Verbo Tabs
//
//  Created by Javier López Achondo on 03-01-16.
//  Copyright © 2016 Javier López Achondo. All rights reserved.
//

import UIKit

class SitioViewController: UIViewController {

    @IBOutlet weak var WebView: UIWebView!
    var URLactual : NSString = "http://www.cvd.cl/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Colores y estilo
        navigationController?.navigationBar.barTintColor = UIColor(red: 3/255.0, green: 120/255.0, blue: 63/255.0, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barStyle = .BlackTranslucent
    }
    
    override func viewWillAppear(animated: Bool) {
        if Reachability.isConnectedToNetwork() {
            let url_cvd = NSURL(string: URLactual as String)
            let request = NSURLRequest(URL: url_cvd!)
            WebView.loadRequest(request)
        }
        else {
            let alerta = UIAlertController(title: "Error de conexión", message: "Verifique su conexión a Internet", preferredStyle: .Alert)
            let Ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) {
                UIAlertAction in
            }
            alerta.addAction(Ok)
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        if WebView.request?.URL!.absoluteString != nil {
            URLactual = (WebView.request?.URL!.absoluteString)!
        }
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
