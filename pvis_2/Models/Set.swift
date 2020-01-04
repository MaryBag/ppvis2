//
//  BooksSet.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation

class Set {
    private var set: [Publication] = []
    var search: Search
    
    init() {
        self.search = Search(set: self.set)
    }
    
    func addPublication(publication: Publication) {
        set.append(publication)
    }
    
    func deletePublication(publication: Publication) {
        var counter = 0
        for pub in self.set {
            if pub.isEqual(p: publication) {
                break
            }
            counter += 1
        }
        if counter < set.count {
            set.remove(at: counter)
            
        }
    }
       
    func getPublications() -> ([Book], [Newspaper], [ComicBook], [Journal]) {
        var books = [Book]()
        var newspapers = [Newspaper]()
        var comics = [ComicBook]()
        var journals = [Journal]()
        for p in self.set {
            if let b = p as? Book {
                books.append(b)
            } else if let n = p as? Newspaper {
                newspapers.append(n)
            } else if let c = p as? ComicBook {
                comics.append(c)
            } else if let j = p as? Journal { 
                journals.append(j)
            }
        }
        return (books, newspapers, comics, journals)
    }
    
}
