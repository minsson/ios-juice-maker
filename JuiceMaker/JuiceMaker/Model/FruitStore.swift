//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private let storedStrawberry: Fruit = Fruit(name: .strawberry, quantity: 10)
    private let storedBanana: Fruit = Fruit(name: .banana, quantity: 10)
    private let storedKiwi: Fruit = Fruit(name: .kiwi, quantity: 10)
    private let storedPineapple: Fruit = Fruit(name: .pineapple, quantity: 10)
    private let storedMango: Fruit = Fruit(name: .mango, quantity: 10)
    
    private func findStoredFruit(of fruitName: Fruit.Name) -> Fruit {
        switch fruitName {
        case .strawberry:
            return storedStrawberry
        case .banana:
            return storedBanana
        case .kiwi:
            return storedKiwi
        case .pineapple:
            return storedPineapple
        case .mango:
            return storedMango
        }
    }

    func checkStock(for requiredIngredient: Fruit) -> Bool {
        if findStoredFruit(of: requiredIngredient.name).quantity < requiredIngredient.quantity {
            return false
        } else {
            return true
        }
    }
    
    func useIngredients(of requiredIngredients: Fruit) -> Bool {
        let storedFruit: Fruit = findStoredFruit(of: requiredIngredients.name)
        
        guard checkStock(for: requiredIngredients) else {
            return false
        }
        
        storedFruit.changeQuantity(to: storedFruit.quantity - requiredIngredients.quantity)
        
        return true
    }
    
    func updateQuantity(to requiredChange: Fruit) -> Bool {
        let storedFruit: Fruit = findStoredFruit(of: requiredChange.name)
        
        storedFruit.changeQuantity(to: requiredChange.quantity)

        if storedFruit.quantity >= 0 {
            return true
        } else {
            return false
        }
    }
}
