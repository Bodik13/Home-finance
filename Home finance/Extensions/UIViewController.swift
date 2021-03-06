//
//  UIViewController.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/18/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func  showAllert(title: String?, message: String?) {
        let allert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        allert.addAction(okAction)
        self.show(allert, sender: nil)
    }
}
