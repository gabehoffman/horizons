//
//  SinglePlanViewController.swift
//  HorizonsPlanningTool
//
//  Created by Gabe Hoffman on 2/3/16.
//  Copyright © 2016 Hoffman Tools. All rights reserved.
//

import UIKit

class SinglePlanViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var timelineField: UITextField!
    @IBOutlet var dateCreatedLabel: UILabel!
    @IBOutlet var planIDNumberLabel: UILabel!
    
    @IBOutlet var beyondTextView: UITextView!
    @IBOutlet var backgroundTextViewOne: UITextView!
    @IBOutlet var backgroundTextViewTwo: UITextView!
    @IBOutlet var backgroundTextViewThree: UITextView!
    @IBOutlet var backgroundTextViewFour: UITextView!
    @IBOutlet var midgroundTextView: UITextView!
    @IBOutlet var foregroundTextViewOne: UITextView!
    @IBOutlet var foregroundTextViewTwo: UITextView!
    @IBOutlet var foregroundTextViewThree: UITextView!
    @IBOutlet var foregroundTextViewFour: UITextView!
    
    var plan: HorizonsPlan! {
        didSet {
            navigationItem.title = plan.title
        }
    }
    
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
        return formatter
    }()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        titleField.text = plan.title
        timelineField.text = "\(plan.backgroundTimelineInMonths) Months"
        planIDNumberLabel.text = plan.planIDNumber
        dateCreatedLabel.text = dateFormatter.stringFromDate(plan.dateCreated)
        
        beyondTextView.text = plan.beyondDescription
        backgroundTextViewOne.text = plan.backgroundOne
        backgroundTextViewTwo.text = plan.backgroundTwo
        backgroundTextViewThree.text = plan.backgroundThree
        backgroundTextViewFour.text = plan.backgroundFour
        midgroundTextView.text = plan.midgroundDescription
        foregroundTextViewOne.text = plan.foregroundOne
        foregroundTextViewTwo.text = plan.foregroundTwo
        foregroundTextViewThree.text = plan.foregroundThree
        foregroundTextViewFour.text = plan.foregroundFour
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        plan.title = titleField.text ?? ""
        plan.planIDNumber = planIDNumberLabel.text
        
    }
    
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
