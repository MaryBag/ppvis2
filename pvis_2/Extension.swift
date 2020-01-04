//
//  Extension.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {

    mutating func remove(_ element: Element) {
        _ = index(of: element).flatMap {
            self.remove(at: $0)
        }
    }
}
