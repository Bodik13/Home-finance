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
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var selectedCategoryID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if self.selectedCategoryID != nil {
            StoreManager.sharedInstance.createTransaction(idCategory: self.selectedCategoryID, description: self.descriptionTextField.text, cost: Int(self.emountTextField.text!))
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func selectCategoryButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toCategories", sender: nil)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if let categoriesVC = segue.destination as? CategoriesViewController {
            categoriesVC.saveAction = { [unowned self] (category) in
                print(category.name)
            }
        }
     }
 
    
    
    
}
