//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by minsson, seohyeon2 on 2022/05/02.
//

import UIKit

class InventoryViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func test(_ sender: UIStepper) {
        
        
        juiceMaker.store.addInventoryByOne(of: .strawberry)
        updateFruitsCountLabels()
        print(sender.value)
    }
}
