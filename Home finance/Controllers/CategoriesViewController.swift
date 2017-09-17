//
//  CategoriesViewController.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/17/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var categories = [Category]() {
        didSet {
            self.categoriesTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.categories = StoreManager.sharedInstance.allCategories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCell")
        cell.textLabel?.text = "\(self.categories[indexPath.row].id)"
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}