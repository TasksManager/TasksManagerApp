//
//  TaskNavigationBar.swift
//  TasksManagerApp
//
//  Created by Oxana Lobysheva on 22/12/2019.
//  Copyright © 2019 TEAM (Lobysheva and Tolstikov and Semerikov). All rights reserved.
//

import Foundation
import UIKit

class TaskNavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize(){
        self.backgroundColor = .tmaColor
        let navigationItem = UINavigationItem(title: "TASK - TODAY")
        let addBtn = UIBarButtonItem(
        barButtonSystemItem: UIBarButtonItem.SystemItem.add,
        target: nil,
        action: #selector(selectorX))
        navigationItem.rightBarButtonItem = addBtn
        self.setItems([navigationItem], animated: false)
    }
    
    @objc func selectorX() {
    }
    
}
