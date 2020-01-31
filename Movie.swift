//
//  Movie.swift
//  MyMovies
//
//  Created by Артём Шишкин on 31.01.2020.
//  Copyright © 2020 Артём Шишкин. All rights reserved.
//

import Foundation
import RealmSwift

class Movie: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var director: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var stars: String = ""
    @objc dynamic var favorite: Bool = false
}

