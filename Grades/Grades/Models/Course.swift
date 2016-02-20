//
//  Course.swift
//  Grades
//
//  Created by S209e19 on 19/02/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import Foundation

class Course {
    
    // MARK: - Properties
    var name:String?
    var grade:Float?
    
    // MARK: Init
    init(name:String, grade:Float){
        self.name = name
        self.grade = grade
    }
    
    convenience init(){
        self.init(name:"", grade:0.0)
    }
    
    // MARK: Utils
    class func courses() ->[Course]{
        var data = [Course]()
        let rawData = [
            ["name":"Formulación y Evaluación de Proyectos", "grade": 3.5],
            ["name":"Ingeniería software II", "grade": 4.5],
            ["name":"Sistemas de Información", "grade": 2.5],
            ["name":"Sistemas Operativos", "grade": 3.5],
            ["name":"Algebra y Trigonometría", "grade": 1.5],
            ["name":"Análisis Geométrico", "grade": 2.0]
        ]
        
        for item in rawData{
            let course = Course(name: item["name"] as! String, grade: item["grade"] as! Float)
            data.append(course)
        }
        
        return data
    }
    
}
