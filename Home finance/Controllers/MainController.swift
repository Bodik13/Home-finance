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
    
    var transactions = [Transaction]() {
        didSet {
            self.transactionsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home finance"
        let categoryItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCategoryClick))
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(transactions[indexPath.row].cost)"
        return cell
    }
}
