//
//  PlanStore.swift
//  OneFour
//
//  Created by Gabe Hoffman on 2/2/16.
//  Copyright © 2016 Hoffman Tools. All rights reserved.
//

import UIKit

class PlanStore {
    var allPlans: [HorizonsPlan] = []
    
    func createEmptyPlan() -> HorizonsPlan {
        let newPlan = HorizonsPlan()
        allPlans.append(newPlan)
        return newPlan
    }
    
    func createEmptyPlans(count: Int) {
        for _ in 1..<count {
            let newPlan = HorizonsPlan()
            allPlans.append(newPlan)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can re-insert it
        let movedItem = allPlans[fromIndex]
        
        // Remove item from array
        allPlans.removeAtIndex(fromIndex)
        
        // Insert item in array at new location
        allPlans.insert(movedItem, atIndex: toIndex)
    }
    
    func removeItem(plan: HorizonsPlan) {
        if let index = allPlans.indexOf(plan) {
            allPlans.removeAtIndex(index)
        }
    }
}
