//
//  UIButton+Extensions.swift
//  TasksManagerApp
//
//  Created by Oxana Lobysheva on 28/01/2020.
//  Copyright © 2020 TEAM (Lobysheva and Tolstikov and Semerikov). All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func customizeButton(imageName: String, size: CGFloat) {
        self.setImage(UIImage(named: imageName), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: size)
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func customizeImageButton(imageName: String) {
        self.backgroundColor = .white
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
        self.setImage(UIImage(named: imageName), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
