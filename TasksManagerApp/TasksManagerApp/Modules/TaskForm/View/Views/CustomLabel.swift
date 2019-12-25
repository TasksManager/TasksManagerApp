//
//  CustomLabel.swift
//  TasksManagerApp
//
//  Created by maxim on 22.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    // MARK: - Init
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }

}
