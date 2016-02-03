//
//  oneFourOneFour.swift
//  OneFour
//
//  Created by Gabe Hoffman on 2/2/16.
//  Copyright © 2016 Hoffman Tools. All rights reserved.
//

import UIKit


class HorizonsPlan: NSObject {
    var title: String
    let dateCreated: NSDate
    var planIDNumber: String?
    
    var beyondDescription: String
    var beyondTimelineInMonths: Int
    var backgroundOne: String, backgroundTwo: String, backgroundThree: String, backgroundFour: String
    var backgroundTimelineInMonths: Int {
        return beyondTimelineInMonths / 2
    }
    var midgroundDescription: String
    var midgroundTimelineInMonths: Int {
        return backgroundTimelineInMonths / 2
    }
    var foregroundOne: String, foregroundTwo: String, foregroundThree: String, foregroundFour: String
    var foregroundTimelineInMonths: Int {
        return backgroundTimelineInMonths / 4
    }
    
    let people = ["Dave's", "Gabe's", "Kim's", "Marci's", "Rebecca's", "Jen's", "Jeremy's"]
    let adjectives = ["Big", "Huge", "Daring", "Audacious", "Timid", "Brazen", "Bold", "Docile", "Terrible", "Insane", "Ridiculous", "Incredible"]
    
    
    init(title: String, planIDNumber: String?, beyondTimelineInMonths: Int) {
        self.title = title
        self.beyondTimelineInMonths = beyondTimelineInMonths
        self.planIDNumber = planIDNumber
        beyondDescription = "Our big huge amazing vision statement in one paragraph that describes what our group is hoping to accomplish in the next time \(beyondTimelineInMonths)."
        backgroundOne = "The first of four objectives that must be accomplished within the next \(backgroundTimelineInMonths) months for the group to accomplish the vision we have set out."
        backgroundTwo = "The second of four objectives that must be accomplished within the next \(backgroundTimelineInMonths) months for the group to accomplish the vision we have set out."
        backgroundThree = "The third of four objectives that must be accomplished within the next \(backgroundTimelineInMonths) months for the group to accomplish the vision we have set out."
        backgroundFour = "The last of four objectives that must be accomplished within the next \(backgroundTimelineInMonths) months for the group to accomplish the vision we have set out."
        midgroundDescription = "This is the one most important goal which must be accomplished in the first \(midgroundTimelineInMonths) months for the group to be on task toward completion of it’s \(backgroundTimelineInMonths) month aims."
        foregroundOne = "This is the first of the four things the group wants to accomplish in the next \(foregroundTimelineInMonths) days."
        foregroundTwo = "This is the second of the four things the group wants to accomplish in the next \(foregroundTimelineInMonths) days."
        foregroundThree = "This is the third of the four things the group wants to accomplish in the next \(foregroundTimelineInMonths) days."
        foregroundFour = "This is the forth of the four things the group wants to accomplish in the next \(foregroundTimelineInMonths) days."
        dateCreated = NSDate()
        
    }
    
    convenience init(random: Bool = false) {
        if random {
            beyondTimelineInMonths = Int(arc4random_uniform(36)) + 12
            let peopleRandomIndex = Int(arc4random_uniform(UInt32(people.count - 1)))
            let adjectivesRandomIndex = Int(arc4random_uniform(UInt32(adjectives.count - 1)))
            title = "\(people[peopleRandomIndex]) \(adjectives[adjectivesRandomIndex]) \(beyondTimelineInMonths) Month Plan"
            planIDNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
            self.init(title: title, planIDNumber: planIDNumber, beyondTimelineInMonths: beyondTimelineInMonths)
        } else {
            self.init(title: "", planIDNumber: nil, beyondTimelineInMonths: beyondTimelineInMonths)
        }
    }
    
}