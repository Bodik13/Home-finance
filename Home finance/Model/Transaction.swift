//
//  Transaction.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/17/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import Foundation

class Transaction: NSObject, NSCoding {
    
    struct Keys {
        static let idKey = "id"
        static let idCategotyKey = "category"
        static let descriptionKey = "description"
        static let costKey = "cost"
        static let dateKey = "date"
        static let transactionTypeKey = "transactionTypeKey"
    }
    
    var id: Int?
    var idCategory: Int?
    var transactionType: Int?
    var tranDescription: String?
    var cost: Int?
    var date: Date?

    override init() {
        super.init()
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: Keys.idKey)
        aCoder.encode(self.idCategory, forKey: Keys.idCategotyKey)
        aCoder.encode(self.tranDescription, forKey: Keys.descriptionKey)
        aCoder.encode(self.cost, forKey: Keys.costKey)
        aCoder.encode(self.date, forKey: Keys.dateKey)
        aCoder.encode(self.transactionType, forKey: Keys.transactionTypeKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: Keys.idKey) as? Int
        self.idCategory = aDecoder.decodeObject(forKey: Keys.idCategotyKey) as? Int
        self.tranDescription = aDecoder.decodeObject(forKey: Keys.descriptionKey) as? String
        self.cost = aDecoder.decodeObject(forKey: Keys.costKey) as? Int
        self.date = aDecoder.decodeObject(forKey: Keys.dateKey) as? Date
        self.transactionType = aDecoder.decodeObject(forKey: Keys.transactionTypeKey) as? Int
    }
}
