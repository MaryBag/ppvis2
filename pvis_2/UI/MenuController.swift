//
//  MenuController.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import UIKit
import Resolver

class MenuController: UIViewController {
    
    var presenter: Librarian?

    @IBOutlet weak var atHome: UISegmentedControl!
    @IBAction func takeBook(_ sender: Any) {
        presenter?.bookSet.search.search(controller: self)
    }
    @IBAction func payDebt(_ sender: Any) {
        let c: DebtController = Resolver.ui.resolve(args: presenter)
        self.navigationController?.pushViewController(c, animated: true)
    }
    @IBAction func showBooks(_ sender: Any) {
        let controller: TableController = Resolver.ui.resolve(args: self.presenter)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
