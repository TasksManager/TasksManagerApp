//
//  TaskCellView.swift
//  TasksManagerApp
//
//  Created by Oxana Lobysheva on 28/01/2020.
//  Copyright © 2020 TEAM (Lobysheva and Tolstikov and Semerikov). All rights reserved.
//

import Foundation
import UIKit

class TaskCellView: UICollectionViewCell {
    
    
    let taskImageButton: UIButton = {
        let button = UIButton()
        button.customizeImageButton(imageName: "TaskDefault")
        return button
    }()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.customizeTextLabel(text: "Here you will see a Task", size: CGFloat(24))
        return label
    }()
    
    let delegateLabel: UILabel = {
        let label = UILabel()
        label.customizeTextLabel(text: "Delegate: Dartik", size: CGFloat(15))
        return label
    }()
    
    let deadlineLabel: UILabel = {
        let label = UILabel()
        label.customizeDateLabel(date: Date(), size: CGFloat(15))
        return label
    }()
    
    
    let completeButton: UIButton = {
        let button = UIButton()
        button.customizeButton(imageName: "CompleteButton", size: CGFloat(20))
        return button
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.customizeButton(imageName: "EditButton", size: CGFloat(20))
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.customizeButton(imageName: "DeleteButton", size: CGFloat(20))
        return button
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.horizontal
        sv.alignment = UIStackView.Alignment.center
        sv.distribution = UIStackView.Distribution.fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false;
        return sv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    
    func addViews(){
        
        addSubview(taskLabel)
        addSubview(deadlineLabel)        
        addSubview(completeButton)
        addSubview(deleteButton)
        addSubview(editButton)
        addSubview(stackView)
        
        taskLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: -20).isActive = true
        taskLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        deadlineLabel.leftAnchor.constraint(equalTo: taskLabel.leftAnchor).isActive = true
        deadlineLabel.centerYAnchor.constraint(equalTo: taskLabel.centerYAnchor, constant: 25).isActive = true
        deadlineLabel.widthAnchor.constraint(equalToConstant: 70)
        
        stackView.addArrangedSubview(completeButton)
        stackView.addArrangedSubview(editButton)
        stackView.addArrangedSubview(deleteButton)
        
        stackView.topAnchor.constraint(equalTo: deadlineLabel.bottomAnchor, constant: 10).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
