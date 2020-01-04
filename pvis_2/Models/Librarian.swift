//
//  Librarian.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation
import Resolver

class Librarian {
    var controller: EntranceController
    var cardManager = FileCabinet()
    var bookSet = Set()
    
    init(controller: EntranceController) {
        self.controller = controller
    }
    
    func takeToHome() {
        
    }
    
    func take() {
        
    }
    
    func paymentDebt(fio: String, debt: String) {
        
    }
    
    func showBooks() {
        let c: TableController = Resolver.ui.resolve(args: self)
        controller.navigationController?.pushViewController(c, animated: true)
    }
    
    func checkCard(card: Card) -> Bool {
        let c = cardManager.findCard(card: card)
        if c.getFio() != "" {
            return true
        } else {
            return false
        }
    }
    
    func registration() {
        let c:  RegistrationController = Resolver.ui.resolve(args: self)
        controller.navigationController?.pushViewController(c, animated: true)
    }
    
}
