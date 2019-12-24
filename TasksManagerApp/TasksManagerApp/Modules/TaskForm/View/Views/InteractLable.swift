//
//  InteractLable.swift
//  TasksManagerApp
//
//  Created by maxim on 22.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

/// Отображает информацию на форме. По нажатию срабатывает обработчик.
class InteractLable: UILabel {

    // MARK: - Init
    
    init(text: String, tag: Int) {
        super.init(frame: .zero)
        self.tag = tag
        self.text = text
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        isUserInteractionEnabled = true
    }

}
