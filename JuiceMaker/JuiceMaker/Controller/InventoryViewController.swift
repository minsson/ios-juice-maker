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
        updateFruitsCountLabels()
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
