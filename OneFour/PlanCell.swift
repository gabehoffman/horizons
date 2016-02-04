//
//  PlanCell.swift
//  OneFour
//
//  Created by Gabe Hoffman on 2/3/16.
//  Copyright © 2016 Hoffman Tools. All rights reserved.
//

import UIKit

class PlanCell: UITableViewCell {
    
    @IBOutlet var planLabel: UILabel!
    @IBOutlet var planIDNumberLabel: UILabel!
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        planLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        planIDNumberLabel.font = caption1Font
    }
    
}