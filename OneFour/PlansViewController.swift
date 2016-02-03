//
//  planViewController.swift
//  OneFour
//
//  Created by Gabe Hoffman on 2/2/16.
//  Copyright © 2016 Hoffman Tools. All rights reserved.
//

import UIKit

class PlansViewContoller: UITableViewController {
    
    var planStore: PlanStore!
    
    @IBAction func addNewPlan(sender: AnyObject) {
        // Create a new Item and add it to the store
        let newPlan = planStore.createEmptyPlan()
        
        // Figure out where that item is in the array
        if let index = planStore.allPlans.indexOf(newPlan) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            // Insert this new row into the table.
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // If the triggered segue is the "ShowItem" segue
        if segue.identifier == "ShowPlan" {
            
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the item associated with this row and pass it along
                let plan = planStore.planStore[row]
                let singlePlanViewController = segue.destinationViewController as! SinglePlanViewController
                singlePlanViewController.plan = plan
            }
        }
    }
    
    override func tableView(tableView: UITableView,
        moveRowAtIndexPath sourceIndexPath: NSIndexPath,
        toIndexPath destinationIndexPath: NSIndexPath) {
            // Update the model
            planStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            // If the table view is asking to commit a delete command...
            if editingStyle == .Delete {
                let plan = planStore.allPlans[indexPath.row]
                
                
                let title = "Delete \(plan.title)?"
                let message = "Are you sure you want to delete this plan?"
                
                let ac = UIAlertController(title: title,
                    message: message,
                    preferredStyle: .ActionSheet)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                ac.addAction(cancelAction)
                
                let deleteAction = UIAlertAction(title: "Delete", style: .Destructive,
                    handler: { (action) -> Void in
                        // Remove the item from the store
                        self.planStore.removeItem(plan)
                        
                        // Also remove that row from the table view with an animation
                        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                })
                ac.addAction(deleteAction)
                
                // Present the alert controller
                presentViewController(ac, animated: true, completion: nil)
            }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planStore.allPlans.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PlanViewCell", forIndexPath: <#T##NSIndexPath#>)
        let plan = planStore.allPlans[indexPath.row]
        
        cell.textLabel?.text = plan.title
        cell.detailTextLabel?.text = plan.planIDNumber
        
        return cell
    }
    
}
