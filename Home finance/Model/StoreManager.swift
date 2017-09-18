//
//  StoreManager.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/17/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import Foundation

class StoreManager: NSObject {
    static let sharedInstance = StoreManager()
    
    private override init() {
        super.init()
        self.loadData()
    }
    
    private var categories = [Category]()
    private var transactions = [Transaction]()
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("this is the url path in the documentDirectory \(url)")
        return (url!.appendingPathComponent("Data").path)
    }
    
    deinit {
        self.saveData()
    }
    
    func addCategory(name: String, description: String?) {
        let newCategory = Category()
        newCategory.id = UUID().hashValue
        newCategory.name = name
        newCategory.catDescription = description
        self.categories.append(newCategory)
        //save category to phone memmory
    }
    
    func allCategories() -> [Category] {
        return self.categories
    }
    
    func createTransaction(idCategory: Int?, description: String?, cost: Int?) {
        let newTransaction = Transaction()
        newTransaction.id = UUID().hashValue
        newTransaction.idCategory = idCategory
        newTransaction.tranDescription = description
        newTransaction.cost = cost
        self.transactions.append(newTransaction)
    }
    
    func allTransactions() -> [Transaction] {
        return self.transactions
    }
    
    func saveData() {
        NSKeyedArchiver.archiveRootObject(self.transactions, toFile: filePath)
        NSKeyedArchiver.archiveRootObject(self.categories, toFile: filePath)
    }
    
    private func loadData() {
        if let transactions = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Transaction] {
            self.transactions = transactions
        }
        if let categories = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Category] {
            self.categories = categories
        }
    }
}
