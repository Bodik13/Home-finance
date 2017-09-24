//
//  ViewController.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/17/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transactionsTableView: UITableView!
    @IBOutlet weak var expenseButton: OvalButton!
    @IBOutlet weak var incomeButton: OvalButton!
    
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
        self.expenseButton.backgroundColor = UIColor.red
        self.incomeButton.setTitle("Income", for: .normal)
        self.incomeButton.backgroundColor = UIColor.green
        let categoryItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(addCategoryClick))
        self.navigationItem.setRightBarButton(categoryItem, animated: true)
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
    @IBAction func expenseButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toNewTransaction", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(transactions[indexPath.row]. ?? "")"
        return cell
    }
}

