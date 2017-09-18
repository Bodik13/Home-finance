//
//  Category.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/17/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import Foundation

class Category: NSObject, NSCoding {
    struct Keys {
        static let idKey = "id"
        static let nameKey = "name"
        static let descriptionKey = "description"
    }
    var id: Int?
    var name: String?
    var catDescription: String?
    
    override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: Keys.idKey)
        aCoder.encode(self.name, forKey: Keys.nameKey)
        aCoder.encode(self.catDescription, forKey: Keys.descriptionKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: Keys.idKey) as? Int
        self.name = aDecoder.decodeObject(forKey: Keys.nameKey) as? String
        self.catDescription = aDecoder.decodeObject(forKey: Keys.descriptionKey) as? String
    }
}
