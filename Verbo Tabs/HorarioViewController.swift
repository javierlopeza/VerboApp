//
//  ThirdViewController.swift
//  Verbo Tabs
//
//  Created by Javier López Achondo on 03-01-16.
//  Copyright © 2016 Javier López Achondo. All rights reserved.
//

import UIKit


class HorarioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var cursoPicker: UIPickerView!
    
    var cursos : [String] = [String]()
    
    var curso_seleccionado : String = "Pre Kinder A"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Colores y estilo
        navigationController?.navigationBar.barTintColor = UIColor(red: 3/255.0, green: 120/255.0, blue: 63/255.0, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barStyle = .BlackTranslucent
        
        // Conectar picker
        self.cursoPicker.delegate = self
        self.cursoPicker.dataSource = self
        
        // Lista de los nombres de los cursos con horario.
        cursos = Colegio.cursos_horario()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cursos.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cursos[row]
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        curso_seleccionado = cursos[row]
    }
    
    // Lo que se entrega al realizar la Segue con el boton Ver Horario
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Se verifica que se tiene conexion a Internet
        let hay_conexion = Reachability.isConnectedToNetwork()
        if hay_conexion {
            let DestViewController : HorarioWebViewController = segue.destinationViewController as! HorarioWebViewController
            DestViewController.url_string = Colegio.cursoHorarioURL(curso_seleccionado)
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
