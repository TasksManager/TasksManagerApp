//
//  AnaliticPresenter.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class AnaliticPresenter {
    
    // MARK: - Dependency
    
    weak var viewInput: (UIViewController & AnaliticViewInput)?
    
    // MARK: - Constants
    // MARK: - Public properties
    // MARK: - Private properties
    // MARK: - Init
    // MARK: - Lifecycle ViewController
    // MARK: - Puplic methods
    // MARK: - Private methods
    // MARK: - IBActions
    // MARK: - Buttons methods
    // MARK: - Navigation

}

// MARK: - AnaliticViewOotput

extension AnaliticPresenter: AnaliticViewOutput {
    // FIXME: - Убрать!
    func setBackground() {
        viewInput?.view.backgroundColor = .green
    }
}
