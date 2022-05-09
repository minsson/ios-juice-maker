//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by Minseong Kang on 2022/05/02.
//

import UIKit

class InventoryViewController: UIViewController {
    
    
    @IBOutlet weak var strawberryInventoryLabel: UILabel!
    @IBOutlet weak var bananaInventoryLabel: UILabel!
    @IBOutlet weak var pineappleInventoryLabel: UILabel!
    @IBOutlet weak var kiwiInventoryLabel: UILabel!
    @IBOutlet weak var mangoInventoryLabel: UILabel!
    
    
    @IBOutlet weak var strawberryInventoryStepper: UIStepper!
    @IBOutlet weak var bananaInventoryStepper: UIStepper!
    @IBOutlet weak var pineappleInventoryStepper: UIStepper!
    @IBOutlet weak var kiwiInventoryStepper: UIStepper!
    @IBOutlet weak var mangoInventoryStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsInventoryLabels()
        setingIntialInventory()
    }
    @IBAction func fruitsInventoryStepper(_ sender: UIStepper) {
        strawberryInventoryStepper.autorepeat = true
        strawberryInventoryLabel.text = Int(sender.value).description
    }
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        insertInventory()
    }
    func insertInventory() {
        let oldValue = JuiceMaker.shared.store.fruitsInventory[.strawberry] ?? 0
        let insertValue = Int(strawberryInventoryStepper.value) - oldValue
        let test : [FruitStore.Fruit:Int] = [FruitStore.Fruit.strawberry:insertValue]
        try! JuiceMaker.shared.store.supplyInventory(of: test)
    }
    
    func setingIntialInventory() {
        strawberryInventoryStepper.value = Double(JuiceMaker.shared.store.fruitsInventory[.strawberry] ?? 0)
    }
    func updateFruitsInventoryLabels() {
        let errorValue = 999
        strawberryInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.strawberry] ?? errorValue)
        bananaInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.banana] ?? errorValue)
        pineappleInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.pineapple] ?? errorValue)
        kiwiInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.kiwi] ?? errorValue)
        mangoInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.mango] ?? errorValue)
    }
    
    
    
    
}
