//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 전반적으로 순수함수가 아님. 아닐 땐 스레드 문제 발생 가능 (프로젝트가 커지면. 동시다발적 주문이 들어올 때.) <- 지금은 알 필요 없지만, 나중에 프로젝트 커지면서 알아야 할 개념

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    
    typealias FruitsInventory = [Fruit: Int]
    
    //    var fruitsInventory: FruitsInventory = [:]
    private var fruitsInventory: FruitsInventory = [:]
    // 원래 var로 되어있었음.
    // var로 되어있다 -> 다른 곳에서 활용한다는 뜻 -> 코드를 보는 입장에서는 다른 곳에서 활용되는 중요한 속성이라고 생각할 수밖에 없다
    // -> 이게 나중에는 레거시가 된다.
    // 웬만하면 다 private let으로.
    
    init(initialInventory:Int = 10) {
        Fruit.allCases.forEach { fruitsInventory[$0] = initialInventory }
    }
    // AllCases는 뭐길래 여기서 Fruit enum의 타입을 배열로 가져오나? -> associatedtype
    
    func reduceInventory(of ingredient: FruitsInventory) throws {
        for fruit in ingredient.keys {
            let amountOfIngredient = ingredient[fruit] ?? 0
            guard var inventory = fruitsInventory[fruit] else { throw AppError.invalidInputOfFruit }
            
            print("\(fruit) 사용전 재고: \(inventory)")
            inventory -= amountOfIngredient
            fruitsInventory[fruit] = inventory
            print("\(fruit) 사용후 재고: \(inventory)")
        }
    }
    
    func supplyInventory(of ingredient: FruitsInventory) throws {
        for fruit in ingredient.keys {
            let amountOfSupply = ingredient[fruit] ?? 0
            guard var inventory = fruitsInventory[fruit] else { throw AppError.invalidInputOfFruit }
            
            print("\(fruit) 입고전 재고: \(inventory)")
            inventory += amountOfSupply
            fruitsInventory[fruit] = inventory
            print("\(fruit) 입고후 재고: \(inventory)")
        }
    }
    
    func grabIngredients(of ingredient: FruitsInventory) -> FruitsInventory? {
        for fruit in ingredient.keys {
            let requiredIngredient = ingredient[fruit] ?? 0
            let fruitInventory = self.fruitsInventory[fruit] ?? 0
            
            guard fruitInventory >= requiredIngredient else { return nil }
        }
        return ingredient
    }
    
    
    //============================================================================
    
    // func hasEnoughInventory(of ingredient: FruitsInventory, in inventory: FruitsInventory) throws -> Bool {
    func hasEnoughInventory_웨더_피드백_받은_메서드(of ingredient: FruitsInventory) throws -> Bool {
        for fruit in ingredient.keys {
            let requiredIngredient = ingredient[fruit] ?? 0
            //            let fruitInventory = inventory[fruit] ?? 0
            let fruitInventory = self.fruitsInventory[fruit] ?? 0
            
            if fruitInventory >= requiredIngredient {
                continue
            } else {
                throw AppError.lackOfInventory
            }
        }
        return true
    }
    
    func hasEnoughInventory_웨더_피드백_받기_전(of ingredient: FruitsInventory, in inventory: FruitsInventory) throws -> Bool {
        for fruit in ingredient.keys {
            let requiredIngredient = ingredient[fruit] ?? 0
            let fruitInventory = inventory[fruit] ?? 0

            if fruitInventory >= requiredIngredient {
                continue
            } else {
                throw AppError.lackOfInventory
            }
        }
        return true
    }
}
