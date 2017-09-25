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
    
    var selectedCategory: Category? {
        didSet {
            self.categoryButton.setTitle(selectedCategory?.name, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Transaction"
        self.saveButton.backgroundColor = UIColor.lightGray
        self.saveButton.setTitle("Save", for: .normal)
        self.categoryButton.setTitle("Category", for: .normal)
        self.categoryButton.layer.cornerRadius = 4
        self.categoryButton.layer.borderWidth = 1
        self.categoryButton.layer.borderColor = UIColor.lightGray.cgColor
        self.emountTextField.placeholder = "0"
        self.descriptionTextField.placeholder = "Description"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if self.selectedCategory != nil {
            let currentDate = Date()
            StoreManager.sharedInstance.createTransaction(idCategory: self.selectedCategory?.id, description: self.descriptionTextField.text, cost: Int(self.emountTextField.text ?? "0"), date:currentDate)
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
