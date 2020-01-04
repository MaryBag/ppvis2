//
//  TableController.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import UIKit

class TableController: UITableViewController {
    
    var presenter: Librarian?
    
    let section = ["книги", "газеты", "комексы", "журналы"]
        private var books: [Book] = []
        private var newspapers: [Newspaper] = []
        private var comicBooks: [ComicBook] = []
        private var journals: [Journal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        layotTable()
        
    }
    
    func layotTable() {
        guard let presenter = presenter else {
            return
        }
        (books, newspapers, comicBooks, journals) = presenter.bookSet.getPublications()
        self.tableView.reloadData()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return books.count
        } else if section == 1 {
            return newspapers.count
        } else if section == 2 {
            return comicBooks.count
        } else if section == 3 {
            return journals.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
           if indexPath.section == 0 {
               cell.textLabel?.text = books[indexPath.row].getTitle()
           } else if indexPath.section == 1 {
               cell.textLabel?.text = newspapers[indexPath.row].getTitle()
           } else if indexPath.section == 2 {
               cell.textLabel?.text = comicBooks[indexPath.row].getTitle()
           } else if indexPath.section == 3 {
            cell.textLabel?.text = journals[indexPath.row].getTitle()
           }
           return cell
       }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
    let addAction = UITableViewRowAction(style: .destructive, title: "Взять") { _, indexPath in
//               if indexPath.section == 0 {
//                   self.navigationController?.popViewController(animated: true)
//               } else if indexPath.section == 1 {
//                self.navigationController?.pushViewController(NewTariffController(), animated: true)
//               } else if indexPath.section == 2 {
//                self.navigationController?.pushViewController(NewConversationController(), animated: true)
//               } else if indexPath.section == 3 {
//
//              }
//            self.navigationController?.popViewController(animated: true)
           }
//        addAction.backgroundColor = UIColor.blue
        return [addAction]
    }

}
