//
//  Book.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation
import UIKit

class Publication {
    private var author: String
    private var year: Int
    private var genre: String
    private var title: String
    
    init(author: String, year: Int, genre: String, title: String) {
        self.author = author
        self.year = year
        self.genre = genre
        self.title = title
    }
    
    func isEqual(p: Publication) -> Bool {
        return self.author == p.author && self.year == p.year && self.genre == p.genre && self.title == p.title
    }
    
    func getAuthor() -> String {
        return self.author
    }
    
    func getGenre() -> String {
        return self.genre
    }
    
    func getTitle() -> String {
        return self.title
    }
}

class Book: Publication {
    private var content: String
    
    init(author: String, year: Int, genre: String, title: String, content: String) {
        self.content = content
        super.init(author: author, year: year, genre: genre, title: title)
    }
    
    override func isEqual(p: Publication) -> Bool {
        if let book = p as? Book {
            return super.isEqual(p: book) && self.content == book.content
        } else { 
            return false
        }
    }
}

class Newspaper: Publication {
    private var date: Date
    private var content: String
    
    init(author: String, year: Int, genre: String, title: String, date: Date, content: String) {
        self.content = content
        self.date = date
        super.init(author: author, year: year, genre: genre, title: title)
    }
    
    override func isEqual(p: Publication) -> Bool {
        if let n = p as? Newspaper {
            return super.isEqual(p: n) && self.content == n.content && n.date == self.date
        } else {
            return false
        }
    }
}

class ComicBook: Publication {
    private var date: Date
    private var content: UIImage
    
    init(author: String, year: Int, genre: String, title: String, date: Date, content: UIImage) {
        self.content = content
        self.date = date
        super.init(author: author, year: year, genre: genre, title: title)
    }
    
    override func isEqual(p: Publication) -> Bool {
        if let n = p as? ComicBook {
            return super.isEqual(p: n) && self.content == n.content && n.date == self.date
        } else {
            return false
        }
    }
}

class Journal: Publication {
    private var date: Date
    private var content: UIImage
       
    init(author: String, year: Int, genre: String, title: String, date: Date, content: UIImage) {
        self.content = content
        self.date = date
        super.init(author: author, year: year, genre: genre, title: title)
    }
       
    override func isEqual(p: Publication) -> Bool {
        if let n = p as? Journal {
            return super.isEqual(p: n) && self.content == n.content && n.date == self.date
        } else {
            return false
        }
    }
}
