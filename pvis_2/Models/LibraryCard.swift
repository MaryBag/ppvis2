//
//  LibraryCard.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation
import Resolver

class LibraryCard {
    private var address: String
    private var debts: [String]
    private var phone: String
    private var fio: String
    private var card: Card
    
    init(fio: String, phone: String, address: String, debts: [String]) {
        self.fio = fio
        self.phone = phone
        self.address = address
        self.debts = debts
        self.card = Resolver.models.resolve(args: self.fio)
        card.libraryCard = self
    }
    
    func getCard() -> Card {
        return self.card
    }
    
    func getFio() -> String {
        return self.fio
    }
    
    func setDebt(debt: String) {
        self.debts.append(debt)
    }
    
    func deleteDebt(debt: String) {
        var count = 0
        for d in self.debts {
            if d == debt {
                break
            }
            count += 1
        }
        if count < self.debts.count {
            self.debts.remove(at: count)
        }
    }
}
