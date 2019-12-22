//
//  TaskTitleLAbel.swift
//  TasksManagerApp
//
//  Created by Oxana Lobysheva on 22/12/2019.
//  Copyright © 2019 TEAM (Lobysheva and Tolstikov and Semerikov). All rights reserved.
//

import UIKit

class TaskTitleLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    private func initializeLabel() {
        self.textAlignment = .left
        self.font = UIFont(name: "Helvetica-Bold", size: 24)
        self.textColor = UIColor.white
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 1
    }
    
}
