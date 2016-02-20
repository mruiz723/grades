//
//  ViewController.swift
//  Grades
//
//  Created by S209e19 on 19/02/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    var courses = [Course]()
    let cellIdentifier = "gradeCell"
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        courses = Course.courses()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        let course = courses[indexPath.row]
        cell?.textLabel?.text = course.name
        cell?.detailTextLabel?.text = String(course.grade)
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
}

