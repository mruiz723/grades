//
//  DetailViewController.swift
//  Grades
//
//  Created by S209e19 on 26/02/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate:NSObjectProtocol {
    
    func updateGrade(course:Course, withGrade grade:Float)
    
}

class DetailViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var nameCourseLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var gradeTextField: UITextField!
    
    //MARK: Properties
    var delegate:DetailViewControllerDelegate?
    
    //MARK: IBActions
    @IBAction func edit(sender: AnyObject) {
        self.view.endEditing(true)
        if editButton.selected{
            editButton.selected = false
            if let gradeFloat = Float(gradeTextField.text!){
                if gradeFloat >= 0.0  && gradeFloat <= 5.0{
                    gradeLabel.text = gradeTextField.text
                    gradeLabel.hidden = false
                    gradeTextField.hidden = true
                    delegate?.updateGrade(course, withGrade: gradeFloat)
                }else{
                    let alert = UIAlertController(title: "Error", message: "Debe ingresar un número entre 0.0 y 5.0", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                self.presentViewController(alert, animated: true, completion: nil)
                }
            }
            
        }else{
            editButton.selected = true
            gradeTextField.hidden = false
            gradeLabel.hidden = true
            gradeTextField.text = gradeLabel.text
        }
        
    }
    
    //MARK: Proerties
    var course = Course()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameCourseLabel.text = course.name
        gradeLabel.text = String(course.grade!)
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
    
    //MARK: Utils
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
