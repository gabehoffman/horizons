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
    var backgroundTimelineInMonths: Int
    var midgroundDescription: String
    var midgroundTimelineInMonths: Int
    var foregroundOne: String, foregroundTwo: String, foregroundThree: String, foregroundFour: String
    var foregroundTimelineInMonths: Int
    
    init(title: String, planIDNumber: String?, beyondTimelineInMonths: Int) {
        self.title = title
        self.beyondTimelineInMonths = beyondTimelineInMonths
        backgroundTimelineInMonths = beyondTimelineInMonths / 2
        midgroundTimelineInMonths = backgroundTimelineInMonths / 2
        foregroundTimelineInMonths = midgroundTimelineInMonths / 4
        self.planIDNumber = planIDNumber
        dateCreated = NSDate()
        beyondDescription = "Our big huge amazing vision statement in one paragraph that describes what our group is hoping to accomplish in the next \(beyondTimelineInMonths) months."
        backgroundOne = "The first of four objectives that must be accomplished within the next \(backgroundTimelineInMonths) months for the vision we have set out."
        backgroundTwo = "The second of four objectives that must be accomplished within the next \(backgroundTimelineInMonths) months for the vision we have set out."
        backgroundThree = "The third of four objectives that must be accomplished within the next \(backgroundTimelineInMonths) months for the vision we have set out."
        backgroundFour = "The last of four objectives that must be accomplished within the next \(backgroundTimelineInMonths) months for the vision we have set out."
        midgroundDescription = "This is the one most important goal which must be accomplished in the first \(midgroundTimelineInMonths) months for the group to be on task toward completion of it’s \(backgroundTimelineInMonths) month aims."
        foregroundOne = "This is the first of the four things the group wants to accomplish in the next \(foregroundTimelineInMonths * 30) days."
        foregroundTwo = "This is the second of the four things the group wants to accomplish in the next \(foregroundTimelineInMonths * 30) days."
        foregroundThree = "This is the third of the four things the group wants to accomplish in the next \(foregroundTimelineInMonths * 30) days."
        foregroundFour = "This is the forth of the four things the group wants to accomplish in the next \(foregroundTimelineInMonths * 30) days."
        super.init()
    }
    
    convenience init(random: Bool = false) {
        
        let people = ["Dave's", "Gabe's", "Kim's", "Marci's", "Rebecca's", "Jen's", "Jeremy's"]
        let adjectives = ["Big", "Huge", "Daring", "Audacious", "Timid", "Brazen", "Bold", "Docile", "Terrible", "Insane", "Ridiculous", "Incredible"]
        
        if random {
            let randomTimeline = Int(arc4random_uniform(36)) + 12
            let peopleRandomIndex = Int(arc4random_uniform(UInt32(people.count - 1)))
            let adjectivesRandomIndex = Int(arc4random_uniform(UInt32(adjectives.count - 1)))
            let title = "\(people[peopleRandomIndex]) \(adjectives[adjectivesRandomIndex]) \(randomTimeline) Month Plan"
            let planIDNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
            self.init(title: title, planIDNumber: planIDNumber, beyondTimelineInMonths: randomTimeline)
        } else {
            self.init(title: "", planIDNumber: nil, beyondTimelineInMonths: 12)
        }
    }
    
}