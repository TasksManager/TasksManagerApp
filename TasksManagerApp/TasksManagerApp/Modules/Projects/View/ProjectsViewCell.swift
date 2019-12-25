//
//  ProjectsViewCell.swift
//  TasksManagerApp
//
//  Created by Mikhail Semerikov on 15.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class ProjectsViewCell: UITableViewCell {
    private let projectName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .tmaWhiteColor
        setupProjectName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProjectName() {
        projectName.numberOfLines = 1
        projectName.textAlignment = .left
        projectName.font = .systemFontOfSize(size: 22)
        projectName.textColor = .tmaDarkFontColor
        contentView.addSubview(projectName)
        
        projectName.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = projectName.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                             constant: 15)
        let leadingConstraint = projectName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                                     constant: 15)
        let trailingConstraint = projectName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                                       constant: 15)
        contentView.addConstraints([topConstraint, leadingConstraint, trailingConstraint])
    }
    
    func configure(_ title: String) {
        projectName.text = title
    }
    
}
