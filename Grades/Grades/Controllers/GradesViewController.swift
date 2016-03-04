//
//  GradesViewController.swift
//  Grades
//
//  Created by S209e19 on 26/02/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import UIKit

class GradesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var courses = [Course]()
    let cellIdentifier = "gradeCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courses = Course.courses()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let detailVC = segue.destinationViewController as? DetailViewController{
            if let course = sender as? Course{
                detailVC.delegate = self
                detailVC.course = course
            }
        }
    }

    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        let course = courses[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = course.name
        cell?.detailTextLabel?.text = String(course.grade!)
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let course = courses[indexPath.row]
        self.performSegueWithIdentifier("detail", sender: course)
        
    }
    
    // MARK: - DetailViewControllerDelegate
    func updateGrade(course: Course, withGrade grade: Float) {
        let index = courses.indexOf { $0 === course }

        if index != nil{
            course.grade = grade
            courses[index!] = course
            tableView.reloadData()
        }
        
    }
}
