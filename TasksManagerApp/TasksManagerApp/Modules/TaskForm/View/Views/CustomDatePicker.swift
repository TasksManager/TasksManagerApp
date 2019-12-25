//
//  CustomDatePicker.swift
//  TasksManagerApp
//
//  Created by maxim on 24.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class CustomDatePicker: UIView {

    // MARK: - Public properties
    
    var callback: ((Date) -> Void)?
    
    // MARK: - Private properties
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        return datePicker
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(tappedDone), for: .touchUpInside)
        return button
    }()
    
    private var date: Date
    
    // MARK: - Init
    
    init(date: Date, frame: CGRect) {
        self.date = date
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func configure() {
        backgroundColor = .blue
        addSubwiews()
        setupDate()
    }
    
    private func addSubwiews() {
        addSubview(datePicker)
        addSubview(doneButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.widthAnchor.constraint(equalTo: self.widthAnchor),
            datePicker.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            doneButton.widthAnchor.constraint(equalToConstant: 120.0),
            doneButton.heightAnchor.constraint(equalToConstant: 50.0),
            doneButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            doneButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 40.0)
        ])
    }
    
    private func setupDate() {
        datePicker.setDate(date, animated: true)
    }
    
    @objc private func tappedDone() {
        callback?(datePicker.date)
        removeFromSuperview()
    }

}
