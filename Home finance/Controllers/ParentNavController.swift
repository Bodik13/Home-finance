//
//  ParentNavController.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/25/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit

class ParentNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barStyle = UIBarStyle.black
        self.navigationBar.tintColor = UIColor.white

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
