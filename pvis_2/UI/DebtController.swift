//
//  DebtController.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import UIKit

class DebtController: UIViewController {
    
    var presenter: Librarian?
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var fio: UITextField!
    @IBOutlet weak var debt: UITextField!
    @IBOutlet weak var price: UITextField!
    
    @IBAction func pay(_ sender: Any) {
        if Int(price.text ?? "") != nil {
            guard let fio = fio.text, let debt = debt.text else {
                return
            }
            presenter?.cardManager.deleteDebt(fio: fio, debt: debt)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
