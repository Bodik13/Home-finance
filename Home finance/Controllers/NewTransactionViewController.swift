//
//  NewTransactionViewController.swift
//  Home finance
//
//  Created by ITA student on 9/19/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit

class NewTransactionViewController: UIViewController {
    
    @IBOutlet weak var emountTextField: UITextField!
    @IBOutlet weak var saveButton: OvalButton!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var transactionType: TransactionType = .expense
    var selectedCategory: Category? {
        didSet {
            self.categoryButton.setTitle(selectedCategory?.name, for: .normal)
        }
    }
    var transactionForEdit: Transaction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.saveButton.backgroundColor = Defaults.Colors.LIGHT_GREEN_COLOR
        self.saveButton.setTitle("Save", for: .normal)
        self.categoryButton.setTitle("Category", for: .normal)
        self.categoryButton.layer.cornerRadius = 4
        self.categoryButton.layer.borderWidth = 1
        self.categoryButton.layer.borderColor = UIColor.lightGray.cgColor
        self.emountTextField.placeholder = "0"
        self.descriptionTextField.placeholder = "Description"
        
        self.title = "New Transaction"
        
        switch self.transactionType {
        case .expense:
            self.subtitleLabel.text = "Expense transaction"
        case .income:
            self.subtitleLabel.text = "Income transaction"
        case .edit:
            self.subtitleLabel.text = "Edit transaction"
            self.emountTextField.text = String(self.transactionForEdit?.cost ?? 0)
            let category = StoreManager.sharedInstance.getCategory(by: transactionForEdit?.idCategory ?? 0)
            self.descriptionTextField.text = self.transactionForEdit?.tranDescription
            self.selectedCategory = category
            self.transactionType = self.transactionForEdit?.transactionType == 0 ? .income : .expense
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if self.selectedCategory != nil {
            let currentDate = Date()
            StoreManager.sharedInstance.removeTransaction(by: self.transactionForEdit?.id ?? 0)
            StoreManager.sharedInstance.createTransaction(idCategory: self.selectedCategory?.id, description: self.descriptionTextField.text, cost: Int(self.emountTextField.text ?? "0"), date:currentDate, transactionType:self.transactionType)
            self.navigationController?.popViewController(animated: true)
        } else {
            self.showAllert(title: "Error", message: "Please, select category!")
        }
    }
    
    @IBAction func selectCategoryButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toCategories", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let categoriesVC = segue.destination as? CategoriesViewController {
            categoriesVC.saveAction = { [unowned self] (category) in
                self.selectedCategory = category
            }
        }
    }
}
