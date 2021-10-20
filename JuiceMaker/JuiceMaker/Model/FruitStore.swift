//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    private static let defaultAmountPerFruit = 10
    private var inventory: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            self.inventory[fruit] = FruitStore.defaultAmountPerFruit
        }
    }
    
    func increase(_ fruit: Fruit, amount: Int) throws {
        guard let leftAmount = self.inventory[fruit] else {
            throw JuiceMakerError.fruitNotFound
        }
        
        self.inventory[fruit] = leftAmount + amount
    }
    
    func decrease(_ fruit: Fruit, amount: Int) throws {
        guard let leftAmount = self.inventory[fruit] else {
            throw JuiceMakerError.fruitNotFound
        }
        
        guard leftAmount >= amount else {
            throw JuiceMakerError.notEnoughFruit
        }

        self.inventory[fruit] = leftAmount - amount
    }
    
    func has(_ fruit: Fruit, amount: Int) throws {
        guard let leftAmount = self.inventory[fruit] else {
            throw JuiceMakerError.fruitNotFound
        }
        
        guard leftAmount >= amount else {
            throw JuiceMakerError.notEnoughFruit
        }
    }
}
