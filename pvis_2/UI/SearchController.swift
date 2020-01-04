//
//  SearchController.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import UIKit
import Resolver

class SearchController: UIViewController {
    var presenter: Search?
    
    @IBOutlet weak var titlLable: UITextField!
    @IBOutlet weak var author: UITextField!
    @IBOutlet weak var gener: UITextField!
   
    @IBAction func searchByTitle(_ sender: Any) {
        guard let set = presenter?.set else {return}
        let presenter = SearchByName(set: set)
        presenter.text = titlLable.text
        let c: SearchTableController = Resolver.ui.resolve(args: presenter)
        navigationController?.pushViewController(c, animated: true)
    }
    @IBAction func searchByAuthor(_ sender: Any) {
        guard let set = presenter?.set else {return}
        let presenter = SearchByAuthor(set: set)
        presenter.text = titlLable.text
        let c: SearchTableController = Resolver.ui.resolve(args: presenter)
        navigationController?.pushViewController(c, animated: true)
    }
    
    @IBAction func searchByGener(_ sender: Any) {
        guard let set = presenter?.set else {return}
        let presenter = SearchByGenre(set: set)
        presenter.text = titlLable.text
        let c: SearchTableController = Resolver.ui.resolve(args: presenter)
        navigationController?.pushViewController(c, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
