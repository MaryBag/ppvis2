//
//  Card.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation

class Card {
    private var fio: String
    weak var libraryCard: LibraryCard?
    
    init(fio: String) {
        self.fio = fio
    }
    
    func getFio() -> String {
        return self.fio
    }
}
