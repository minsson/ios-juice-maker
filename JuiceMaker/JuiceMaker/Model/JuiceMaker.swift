//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let store = FruitStore()
    
//    func make기존꺼_주석은_웨더_피드백_전(juice: Menu) throws {
//        // let isPossible = try store.hasEnoughInventory(of: juice.recipe, in: store.fruitsInventory)
//        let isPossible = try store.grabIngredients(of: juice.recipe)
//
//        if isPossible {
//            try store.reduceInventory(of: juice.recipe)
//            print("\(juice)쥬스 나왔습니다! 맛있게 드세요!")
//        } else {
//            throw AppError.lackOfInventory
//        }
//    }
    
    func make(juice: Menu) throws {
        let fruitsToUse = store.grabIngredients(of: juice.recipe)
        guard fruitsToUse != nil else {
            throw AppError.lackOfInventory
        }
        try store.reduceInventory(of: juice.recipe)
        print("(juice)쥬스 나왔습니다! 맛있게 드세요!")
    }
}

