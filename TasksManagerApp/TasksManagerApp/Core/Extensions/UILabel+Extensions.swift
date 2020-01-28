//
//  UILabel+Extensions.swift
//  TasksManagerApp
//
//  Created by Oxana Lobysheva on 28/01/2020.
//  Copyright © 2020 TEAM (Lobysheva and Tolstikov and Semerikov). All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func customizeTextLabel(text: String, size: CGFloat) {
        self.font = UIFont.systemFont(ofSize: size)
        self.textColor = .black
        self.backgroundColor = .white
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func customizeDateLabel(date: Date, size: CGFloat) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        self.textColor = UIColor.darkGray
        self.backgroundColor = .white
        self.font = UIFont.systemFont(ofSize: size)
        self.text = "Deadline: \(dateFormatter.string(from: date))"
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
