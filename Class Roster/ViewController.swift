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
        self.title = "Roster"
        var Alex = Person()
        Alex.firstName = "Alex"
        var Jeff = Person()
        Jeff.firstName = "Jeff"
        var Brad = Person()
        Brad.firstName = "Brad"
        self.people = [Alex, Jeff, Brad]
      
    
        
        self.tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            //dequeue a reusable cell from the table view, because the table view keeps a pool of reusable cells
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL",
                forIndexPath: indexPath) as UITableViewCell
        
            var personToDisplay = self.people[indexPath.row]
            cell.textLabel.text = personToDisplay.firstName
            return cell
        

    }
}



