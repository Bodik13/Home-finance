//
//  CustomButton.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/20/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit

class OvalButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 8
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

}
