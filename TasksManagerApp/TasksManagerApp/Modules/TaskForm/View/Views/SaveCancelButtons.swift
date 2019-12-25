//
//  SaveCancelButtons.swift
//  TasksManagerApp
//
//  Created by maxim on 18.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

/**
 СтекВью с двумя кнопками Cancel и Save. Используется на экранах форм.
 */

import UIKit

protocol SaveCancelButtonsDelegate: AnyObject {
    func tappedCancel()
    func tappedSave()
}

class SaveCancelButtons: UIStackView {

    // MARK: - Public properties
    
    weak var delegate: SaveCancelButtonsDelegate?
    
    // MARK: - Private properties
    
    // Кнопка отменить.
    private let cancelButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    // Кнопка сохранить.
    private let saveButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    
    private func configure() {
        axis = .horizontal
        alignment = .center
        distribution = .fillEqually
        
        addButtons()
    }
    private func addButtons() {
        addArrangedSubview(cancelButton)
        addArrangedSubview(saveButton)
    }
    
    @objc private func tappedButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            delegate?.tappedCancel()
        case 1:
            delegate?.tappedSave()
        default:
            break
        }
    }
    
}
