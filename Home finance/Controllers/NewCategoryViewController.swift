//
//  NewCategoryViewController.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/18/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var addButton: OvalButton!

    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    @IBOutlet weak var categoryDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.addButton.backgroundColor = Defaults.Colors.LIGHT_GREEN_COLOR
        self.addButton.setTitle("Save", for: .normal)
        self.categoryImageView.backgroundColor = UIColor.lightGray
        self.categoryImageView.layer.cornerRadius = 8
        self.categoryImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.categoryImageView.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        StoreManager.sharedInstance.addCategory(name: self.categoryNameTextField.text!, description: self.categoryDescription.text)
        self.navigationController?.popViewController(animated: true)
    }
    
    /*E
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
