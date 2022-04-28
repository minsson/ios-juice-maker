//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
=======
//
struct JuiceMaker {
=======
//
struct JuiceMaker {
>>>>>>> Stashed changes
=======
//
struct JuiceMaker {
>>>>>>> Stashed changes
    private let store = FruitStore()
    
    func make(juice: Menu) throws {
        let isPossible = try store.hasEnoughInventory(of: juice.recipe, in: store.fruitsInventory)
        
        if isPossible {
            try store.reduceInventory(of: juice.recipe)
            print("\(juice)쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            throw AppError.lackOfInventory
        }
    }
>>>>>>> Stashed changes
}
