//
//  EntranceController.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import UIKit
import Resolver

class EntranceController: UIViewController {
    var presenter: Librarian?
    @IBOutlet weak var fio: UITextField!
    @IBOutlet weak var regLabel: UILabel!
    
    @IBAction func entrance(_ sender: Any) {
        if presenter?.checkCard(card: Resolver.models.resolve(args: fio.text) as Card) ?? false {
            let controller: MenuController = Resolver.ui.resolve(args: self.presenter)
            self.navigationController?.pushViewController(controller, animated: true)
            regLabel.text = ""
        } else {
            regLabel.text = "Пожалуйста зарегистрируйтесь"
        }
    }
    
    @IBAction func registration(_ sender: Any) {
        presenter?.registration()
        regLabel.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Librarian(controller: self)
    }

    override func loadView() {
        Bundle.main.loadNibNamed("EntranceController", owner: self, options: nil)
    }
}
