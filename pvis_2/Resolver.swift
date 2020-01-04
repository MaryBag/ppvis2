//
//  Resolver.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation
import UIKit
import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        registerUIService()
        registerAppModels()
    }
}

extension Resolver {
    static let ui = Resolver()
    
    static func registerUIService() {
        ui.register {EntranceController(nibName: root.optional(), bundle: root.optional())}
        ui.register { RegistrationController(nibName: root.optional(), bundle: root.optional())}.resolveProperties { (resolver, model, arg) in
            model.presenter = arg as? Librarian
        }
        ui.register{TableController(nibName: root.optional(), bundle: root.optional())}.resolveProperties { (resolver, model, arg) in
            model.presenter = arg as? Librarian
        }
        ui.register{MenuController(nibName: root.optional(), bundle: root.optional())}.resolveProperties { (_, model, arg) in
            model.presenter = arg as? Librarian
        }
        ui.register{ SearchController(nibName: root.optional(), bundle: root.optional())}.resolveProperties { (_, model, arg) in
            model.presenter = arg as? Search
        }
        ui.register{DebtController(nibName: root.optional(), bundle: root.optional())}.resolveProperties { (_, model, arg) in
            model.presenter = arg as? Librarian
        }
        
        ui.register {SearchTableController(nibName: root.optional(), bundle: root.optional())}.resolveProperties { (_, model, arg) in
            model.presenter = arg as? SearchProtocol
        }
    }
}

extension Resolver {
    
    static let models  = Resolver()
    
    static func registerAppModels() {
        models.register {(_, arg) -> Card in
            guard let fio = arg as? String else { return Card(fio: "")}
            return Card(fio: fio)
        }

        models.register{(_, args) -> LibraryCard in
            guard let (fio, phone, address, debts) = args as? (String, String, String, [String]) else {return LibraryCard(fio: "", phone: "", address: "", debts: [])}
            return LibraryCard(fio: fio, phone: phone, address: address, debts: debts)
        }
    }
}
