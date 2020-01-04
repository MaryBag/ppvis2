//
//  Search.swift
//  pvis_2
//
//  Created by Баглай Мария on 12/27/19.
//  Copyright © 2019 BM. All rights reserved.
//

import Foundation
import UIKit
import Resolver

class Search {
    var set: [Publication]
    
    init(set: [Publication]) {
        self.set = set
    }
    
    func search(controller: UIViewController) {
        let c: SearchController = Resolver.ui.resolve(args: self)
        controller.navigationController?.pushViewController(c, animated: true)
    }
    
    func getPublications(_ r: [Publication]) -> ([Book], [Newspaper], [ComicBook], [Journal]) {
        var books = [Book]()
        var newspapers = [Newspaper]()
        var comics = [ComicBook]()
        var journals = [Journal]()
        for p in r {
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

protocol SearchProtocol {
    var text: String? {get set}
    func search() -> ([Book], [Newspaper], [ComicBook], [Journal])
}

class SearchByName: Search, SearchProtocol {
    var text: String?
    func search() -> ([Book], [Newspaper], [ComicBook], [Journal]) {
        var r = [Publication]()
        for p in self.set {
            if text == p.getTitle() {
                r.append(p)
            }
        }
        return self.getPublications(r)
    }
}


class SearchByAuthor: Search, SearchProtocol {
    var text: String?
    func search() -> ([Book], [Newspaper], [ComicBook], [Journal]) {
        var r = [Publication]()
        for p in self.set {
            if text == p.getAuthor() {
                r.append(p)
            }
        }
        return self.getPublications(r)
    }
}


class SearchByGenre: Search, SearchProtocol {
    var text: String?
    func search() -> ([Book], [Newspaper], [ComicBook], [Journal]) {
        var r = [Publication]()
        for p in self.set {
            if text == p.getGenre() {
                r.append(p)
            }
        }
        return self.getPublications(r)
    }
}
