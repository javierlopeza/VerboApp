//
//  ViewController2.swift
//  JSON Reader
//
//  Created by Javier López Achondo on 27-12-15.
//  Copyright © 2015 Javier López Achondo. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var Texto: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let jsonData = NSData(contentsOfURL: NSURL(string: "http://jsonplaceholder.typicode.com/users")!)
    
        do {
            let jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions(rawValue: 0)) as? NSArray
            
            if jsonDict != nil {
                // JSON correcto
                print(jsonDict)
            }
            
            else{
                // JSON null
                print(":(")
                
            }
            
        } catch let error as NSError {
            // error handling
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
