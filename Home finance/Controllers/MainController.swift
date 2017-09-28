//
//  ViewController.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/17/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit

enum TransactionType: Int {
    case income = 0
    case expense = 1
    
    func getType(from value:Int) -> TransactionType {
        switch value {
        case 0:
            return TransactionType.income
        case 1:
            return TransactionType.expense
        default:
            print("error type")
            return TransactionType.expense
        }
    }
}

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transactionsTableView: UITableView!
    @IBOutlet weak var expenseButton: OvalButton!
    @IBOutlet weak var incomeButton: OvalButton!
    
    var transactionType: TransactionType = .expense
    var transactions = [Transaction]() {
        didSet {
            self.transactionsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.transactionsTableView.tableFooterView = UIView(frame: CGRect.zero)
        self.title = "Home finance"
        self.expenseButton.setTitle("Expense", for: .normal)
        self.expenseButton.backgroundColor = Defaults.Colors.EXPENSE_BTN_BG_COLOR
        self.incomeButton.setTitle("Income", for: .normal)
        self.incomeButton.backgroundColor = Defaults.Colors.INCOME_BTN_BG_COLOR
        let categoryItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(addCategoryClick))
        self.navigationItem.setRightBarButton(categoryItem, animated: true)
        
        //configure table
        self.transactionsTableView.layer.cornerRadius = 8
        self.transactionsTableView.backgroundColor = Defaults.Colors.LIGHT_GREY_COLOR.withAlphaComponent(0.3)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func addCategoryClick() {
        self.performSegue(withIdentifier: "toCatefory", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.transactions = StoreManager.sharedInstance.allTransactions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func incomeButtonClicked(_ sender: Any) {
        self.transactionType = .income
        self.performSegue(withIdentifier: "toNewTransaction", sender: nil)
    }
    @IBAction func expenseButtonClicked(_ sender: Any) {
        self.transactionType = .expense
        self.performSegue(withIdentifier: "toNewTransaction", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transactionCell = tableView.dequeueReusableCell(withIdentifier: "transactionCell") as! TransactionTableViewCell
        let transaction = transactions[indexPath.row]
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        transactionCell.textLabel?.text = "\(transactions[indexPath.row].tranDescription ?? "")"
//        transactionCell.detailTextLabel?.text = self.transactions[indexPath.row].date?.toString
        
        transactionCell.nameLabel.text = transaction.tranDescription
        transactionCell.descriptionnameLabel.text = transaction.date?.toString ?? ""
        transactionCell.coastLabel.text = "\(String(describing: transaction.cost ?? 0)) UAH"
        
        switch transaction.transactionType {
        case TransactionType.income.rawValue?:
            transactionCell.transactionState.text = "\u{25B2}"
        case TransactionType.expense.rawValue?:
            transactionCell.transactionState.text = "\u{25BC}"
        default:
            print("...")
        }
        
        return transactionCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StoreManager.sharedInstance.removeTransaction(by: self.transactions[indexPath.row].id ?? 0)
            self.transactions = StoreManager.sharedInstance.allTransactions()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let transactionVC = segue.destination as? NewTransactionViewController {
            transactionVC.transactionType = self.transactionType
        }
    }
}

