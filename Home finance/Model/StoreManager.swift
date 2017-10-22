//
//  StoreManager.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/17/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import Foundation

enum DataType: String {
    case transaction = "Transaction.plist"
    case category = "Category.plist"
}

class StoreManager: NSObject {
    static let sharedInstance = StoreManager()
    
    private override init() {
        super.init()
        self.loadData()
    }
    
    private var categories = [Category]()
    private var transactions = [Transaction]()

    deinit {
        self.saveDataCategory()
        self.saveDataTransaction()
    }
    
    func filePath(type: DataType) -> String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
        return url.appendingPathComponent(type.rawValue)!.path
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
    
    func createTransaction(idCategory: Int?, description: String?, cost: Int?, date: Date?, transactionType: TransactionType?) {
        let newTransaction = Transaction()
        newTransaction.id = UUID().hashValue
        newTransaction.idCategory = idCategory
        newTransaction.tranDescription = description
        newTransaction.cost = cost
        newTransaction.date = date
        newTransaction.transactionType = transactionType?.rawValue
        self.transactions.append(newTransaction)
    }
    
    func updateTransaction(idCategory: Int?, description: String?, cost: Int?, date: Date?, transactionType: TransactionType?) {
        let updateTransaction = Transaction()
        updateTransaction.id = UUID().hashValue
        updateTransaction.idCategory = idCategory
        updateTransaction.tranDescription = description
        updateTransaction.cost = cost
        updateTransaction.date = date
        updateTransaction.transactionType = transactionType?.rawValue
        self.transactions.append(updateTransaction)
    }
    
    func removeTransaction(by id: Int) {
        self.transactions.forEach { (transaction) in
            if transaction.id == id {
                guard let index = self.transactions.index(of: transaction) else { return }
                self.transactions.remove(at: index)
            }
        }
    }
    
    func removeCategory(by id: Int) {
        self.categories.forEach { (category) in
            if category.id == id {
                guard let categoryIndex = self.categories.index(of: category) else { return }
                self.categories.remove(at: categoryIndex)
            }
        }
    }
    
    func getCategory(by id: Int) -> Category? {
        for category in self.categories {
            if category.id == id {
                return category
            }
        }
        return nil
    }
    
    func allTransactions() -> [Transaction] {
        return self.transactions
    }
    
    func saveDataTransaction() {
        NSKeyedArchiver.archiveRootObject(self.transactions, toFile: filePath(type: .transaction))
    }
    
    func saveDataCategory() {
        NSKeyedArchiver.archiveRootObject(self.categories, toFile:  filePath(type: .category))
    }
    
    func saveData() {
        self.saveDataCategory()
        self.saveDataTransaction()
        print("Data saved: Transactions, Categories")
    }
    
    private func loadData() {
        if let transactions = NSKeyedUnarchiver.unarchiveObject(withFile: filePath(type: .transaction)) as? [Transaction] {
            self.transactions = transactions
        }
        if let categories = NSKeyedUnarchiver.unarchiveObject(withFile: filePath(type: .category)) as? [Category] {
            self.categories = categories
        }
    }
}
