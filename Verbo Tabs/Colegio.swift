//
//  cursos.swift
//  Verbo Tabs
//
//  Created by Javier López Achondo on 05-01-16.
//  Copyright © 2016 Javier López Achondo. All rights reserved.
//

import Foundation

public class Colegio {
    
    // Lista de Cursos del Colegio
    class func cursos_horario() -> [String] {
    let lista_cursos = ["Pre Kinder A", "Pre Kinder B", "Pre Kinder C", "Pre Kinder D", "Pre Kinder E",
        "Kinder A", "Kinder B", "Kinder C", "Kinder D", "Kinder E",
        "1º Básico A", "1º Básico B", "1º Básico C", "1º Básico D", "1º Básico E",
        "2º Básico A", "2º Básico B", "2º Básico C", "2º Básico D", "2º Básico E",
        "3º Básico A", "3º Básico B", "3º Básico C", "3º Básico D", "3º Básico E",
        "4º Básico A", "4º Básico B", "4º Básico C", "4º Básico D",
        "5º Básico A", "5º Básico B", "5º Básico C", "5º Básico D",
        "6º Básico A", "6º Básico B", "6º Básico C", "6º Básico D",
        "7º Básico A", "7º Básico B", "7º Básico C", "7º Básico D",
        "8º Básico A", "8º Básico B", "8º Básico C", "8º Básico D",
        "1º Medio A", "1º Medio B", "1º Medio C", "1º Medio D",
        "2º Medio A", "2º Medio B", "2º Medio C", "2º Medio D",
        "3º Medio A", "3º Medio B", "3º Medio C", "3º Medio D", "3º Medio E",
        "4º Medio A", "4º Medio B", "4º Medio C", "4º Medio D", "4º Medio E"]
        return lista_cursos
    }
    
    // Lista de cursos con calendario
    class func cursos_calendario() -> [String] {
        let lista_cursos = [
            "1º Básico A", "1º Básico B", "1º Básico C", "1º Básico D", "1º Básico E",
            "2º Básico A", "2º Básico B", "2º Básico C", "2º Básico D", "2º Básico E",
            "3º Básico A", "3º Básico B", "3º Básico C", "3º Básico D", "3º Básico E",
            "4º Básico A", "4º Básico B", "4º Básico C", "4º Básico D",
            "5º Básico A", "5º Básico B", "5º Básico C", "5º Básico D",
            "6º Básico A", "6º Básico B", "6º Básico C", "6º Básico D",
            "7º Básico A", "7º Básico B", "7º Básico C", "7º Básico D",
            "8º Básico A", "8º Básico B", "8º Básico C", "8º Básico D",
            "1º Medio A", "1º Medio B", "1º Medio C", "1º Medio D",
            "2º Medio A", "2º Medio B", "2º Medio C", "2º Medio D",
            "3º Medio A", "3º Medio B", "3º Medio C", "3º Medio D", "3º Medio E",
            "4º Medio A", "4º Medio B", "4º Medio C", "4º Medio D", "4º Medio E"]
        return lista_cursos
    }
    
    // Recibe un curso y retorna el URL de su Horario como String
    class func cursoHorarioURL(curso_seleccionado : String) -> String {
        if curso_seleccionado.rangeOfString("Kinder") != nil {
            let curso_str = curso_seleccionado.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
            
            let url_str = "http://www.cvd.cl/wp-content/uploads/2014/10/" + curso_str + "_1.pdf"
            return url_str
        }
        
        if curso_seleccionado.rangeOfString("Básico") != nil {
            var curso_str = curso_seleccionado
                .stringByReplacingOccurrencesOfString("º", withString: "")
                .stringByReplacingOccurrencesOfString("á", withString: "a")
                .stringByReplacingOccurrencesOfString(" ", withString: "_")
            
            if ((curso_seleccionado.rangeOfString("1") != nil)||(curso_seleccionado.rangeOfString("2") != nil)||(curso_seleccionado.rangeOfString("3") != nil)||(curso_seleccionado.rangeOfString("4") != nil)) {
                curso_str = curso_str.stringByReplacingOccurrencesOfString("1", withString: "I")
                    .stringByReplacingOccurrencesOfString("2", withString: "II")
                    .stringByReplacingOccurrencesOfString("3", withString: "III")
                    .stringByReplacingOccurrencesOfString("4", withString: "IV")
                let url_str = "http://www.cvd.cl/wp-content/uploads/2014/10/" + curso_str + "_2015.pdf"
                return url_str
            }
                
            else {
                curso_str = curso_str.stringByReplacingOccurrencesOfString("5", withString: "V")
                    .stringByReplacingOccurrencesOfString("6", withString: "VI")
                    .stringByReplacingOccurrencesOfString("7", withString: "VII")
                    .stringByReplacingOccurrencesOfString("8", withString: "VIII")
                let url_str = "http://www.cvd.cl/wp-content/uploads/2014/10/" + curso_str + "_20151.pdf"
                return url_str
            }
        }
        
        if curso_seleccionado.rangeOfString("Medio") != nil {
            let curso_str = curso_seleccionado.stringByReplacingOccurrencesOfString("º", withString: "").stringByReplacingOccurrencesOfString(" ", withString: "_").uppercaseString
            let url_str = "http://www.cvd.cl/wp-content/uploads/2014/10/" + curso_str + "_20151.pdf"
            return url_str
        }
        return "none"
    }
    
    // Recibe un curso y retorna el URL de su Calendario como String
    class func cursoCalendarioURL(curso_seleccionado : String) -> String {
        if (curso_seleccionado.rangeOfString("Básico") != nil){
            let sigla = curso_seleccionado.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("ºBásico", withString: "b").lowercaseString
            if Int(String(curso_seleccionado[curso_seleccionado.startIndex.advancedBy(0)])) <= 4 {
                let ciclo = "bas1"
                let url = "http://www.cvd-colegio.cl/intranet/escolar/" + ciclo + "/" + sigla + "/Lists/Calendario/calendar.aspx"
                return url
            }
            else {
                let ciclo = "bas2"
                let url = "http://www.cvd-colegio.cl/intranet/escolar/" + ciclo + "/" + sigla + "/Lists/Calendario/calendar.aspx"
                return url
            }
        }
        else if (curso_seleccionado.rangeOfString("Medio") != nil){
            let sigla = curso_seleccionado.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("ºMedio", withString: "m").lowercaseString
            let url = "http://www.cvd-colegio.cl/intranet/escolar/emedia/" + sigla + "/Lists/Calendario/calendar.aspx"
            return url
        }
        return "none"
    }
    
    
    
}

