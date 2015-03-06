//
//  ViewController.swift
//  Class Roster
//
//  Created by Jeff Hendershot on 11/5/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let peopleFromArchive = self.loadFromArchive() as [Person]? {
            self.people = peopleFromArchive
        } else {
            self.loadFromPlist()
            self.saveToArchive()
        }
        var hasLaunched = NSUserDefaults.standardUserDefaults().boolForKey("firstTime")

        if hasLaunched == false {
            //this is first launch
            println("first launch")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstTime")
        }
        
        self.title = "Roster"

    
        self.tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
   override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        saveToArchive()
    }
    func loadFromArchive() -> [Person]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String

        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive1") as? [Person] {
            return peopleFromArchive
        }
        return nil
    }
    
    func saveToArchive() {

        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        println(documentsPath)
        NSKeyedArchiver.archiveRootObject(self.people, toFile: documentsPath + "/archive1")
    }
    func loadFromPlist() {
        let plistURL = NSBundle.mainBundle().pathForResource("ClassRosterNew", ofType: "plist")
        
        println(plistURL)
        let plistArray = NSArray(contentsOfFile: plistURL!)
        for object in plistArray! {
            println("looped!")
            if let personDictionary = object as? NSDictionary {
                let firstName = personDictionary["First Name"] as String
                let lastName = personDictionary["Last Name"] as String
                var person = Person(first: firstName, last: lastName)
                self.people.append(person)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.people[selectedIndexPath!.row]
            detailViewController.selectedPerson = personToPass
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //dequeue a reusable cell from the table view, because the table view keeps a pool of reusable cells
        let cell = self.tableView.dequeueReusableCellWithIdentifier("CELL",forIndexPath: indexPath) as PersonTableViewCell
        var personToDisplay = self.people[indexPath.row]
        cell.firstNameLabel.text = personToDisplay.firstName
        cell.lastNameLabel.text = personToDisplay.lastName
        cell.imageView!.image = personToDisplay.image
        return cell
        
    }
}



