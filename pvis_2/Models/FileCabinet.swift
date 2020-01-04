//
//  FileCabinet.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation
import Resolver

class FileCabinet {
    private var libraryCards: [LibraryCard] = []
    
    func addDebt(fio: String, debt: String) {
        for card in self.libraryCards {
            if card.getFio() == fio {
                card.setDebt(debt: debt)
            }
        }
    }
    
    func deleteDebt(fio: String, debt: String) {
        for card in self.libraryCards {
            if card.getFio() == fio {
                card.deleteDebt(debt: debt)
            }
        }
    }
    
    func addLibraryCard(fio: String, phone: String, address: String) -> Card {
        let card: LibraryCard = Resolver.models.resolve(args: (fio, phone, address, []))
        self.libraryCards.append(card)
        return card.getCard() 
    }
    
    func findCard(card: Card) -> LibraryCard {
        var c: LibraryCard?
        for cardL in self.libraryCards {
            if card.getFio() == cardL.getFio() {
                c = cardL
                break
            }
        }
        guard let cl = c else {return Resolver.models.resolve() as LibraryCard}
        return cl
    }
    
    func checkDebts(card: Card) {
        
    }
    
    
    
}
