//
//  RegistrationController.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import UIKit
import Resolver


class RegistrationController: UIViewController {
    var presenter: Librarian?
    
    @IBOutlet weak var fio: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var card: UILabel!
    
    @IBAction func registaration(_ sender: Any) {
        guard let fio = fio.text, let phone = phone.text, let address = address.text else {
            return
        }
        let card = presenter?.cardManager.addLibraryCard(fio: fio, phone: phone, address: address)
        self.card.text = (card?.getFio() ?? "") + ", возьмите читательский билет!"
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
