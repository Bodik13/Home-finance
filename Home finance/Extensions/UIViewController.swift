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
    func hideKeyboardWhenTapArround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(false)
    }
}
