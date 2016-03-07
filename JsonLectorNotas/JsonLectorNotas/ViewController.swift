//
//  ViewController.swift
//  JsonLectorNotas
//
//  Created by Javier López Achondo on 26-12-15.
//  Copyright © 2015 Javier López Achondo. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController {
    
    var asignaturas = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.asignaturas = ["Matematicas", "Lenguaje", "Fisica", "Biologia", "Historia"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.asignaturas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var asignatura : String
        
        asignatura = self.asignaturas[indexPath.row]
        
        cell.textLabel?.text = asignatura
        
        return cell
    }
}

