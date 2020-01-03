//
//  TaskFormView.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

/// Форма редактирования задачи.
class TaskFormView: UIViewController {

    // MARK: - Constants

    let controllerName = "Task"
    
    // MARK: - Public properties
    
    let viewOutput: TaskFormViewOutput
    
    // Начальная дата.
    var dateFromLabel = InteractLable(text: "date", tag: 0)
    // Конечная дата.
    var dateToLabel = InteractLable(text: "date", tag: 1)
    // Тайтл.
    var tfTitle: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .green
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 0
        return textField
    }()
    var tfDescription: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .orange
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        return textField
    }()
    // Выбор проекта
    var projectLabel = InteractLable(text: "project", tag: 2)
    // Цвет.
    var colorLabel = InteractLable(text: "color", tag: 3)
    
    // MARK: - Private properties

    // Название начальной даты.
    private let dateFromTitleLabel = CustomLabel(text: "DateFrom: ")
    // Название конечной даты.
    private let dateToTitleLabel = CustomLabel(text: "DateTo: ")
    // Название тайтла.
    private let titleLabel = CustomLabel(text: "Title: ")
    // Название описания.
    private let descriptionLabel = CustomLabel(text: "Description: ")
    // Описание.
    // Название поля проект.
    private let projectTitleLabel = CustomLabel(text: "Project: ")
    // Название поля цвет.
    private let colorTitleLabel = CustomLabel(text: "Color: ")
    // Левый стек.
    private let leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .trailing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    // Правый стек.
    private let rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    // Стек кнопок.
    private let buttonsStackView: SaveCancelButtons = {
        let stackView = SaveCancelButtons()
        stackView.backgroundColor = .orange
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    // Скролл вью на экране.
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    lazy var leftStackViews = [
        dateFromTitleLabel,
        dateToTitleLabel,
        titleLabel,
        descriptionLabel,
        projectTitleLabel,
        colorTitleLabel
    ]
    lazy var rightStackViews = [
        dateFromLabel,
        dateToLabel,
        tfTitle,
        tfDescription,
        projectLabel,
        colorLabel
    ]
    lazy var subViews = [
        leftStackView,
        rightStackView,
        buttonsStackView
    ]
    
    // MARK: - Init
    
    init(_ presenter: TaskFormViewOutput) {
        self.viewOutput = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Lifecycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotification()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewOutput.didAppear()
    }
    
    // MARK: - Public methods

    
    // MARK: - Private methods
    
    private func configure() {
        view.backgroundColor = .white
        navigationItem.title = controllerName
        addViews()
        assignDelegetes()
        setupConstraints()
    }
    
    private func addViews() {
        view.addSubview(scrollView)
        subViews.forEach { scrollView.addSubview($0) }
        leftStackViews.forEach { leftStackView.addArrangedSubview($0) }
        rightStackViews.forEach { rightStackView.addArrangedSubview($0) }
        
        for view in rightStackViews where view is InteractLable {
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(tappedOnElement(_:)))
            view.addGestureRecognizer(recognizer)
        }
    }
    
    private func assignDelegetes() {
        buttonsStackView.delegate = self
        tfTitle.delegate = self
        tfDescription.delegate = self
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            leftStackView.widthAnchor.constraint(equalToConstant: 100.0),
            leftStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16.0),
            leftStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16.0),
            leftStackView.heightAnchor.constraint(equalToConstant: 360.0),

            rightStackView.topAnchor.constraint(equalTo: leftStackView.topAnchor),
            rightStackView.leftAnchor.constraint(equalTo: leftStackView.rightAnchor, constant: 8.0),
            rightStackView.heightAnchor.constraint(equalTo: leftStackView.heightAnchor),
            rightStackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -16.0),

            buttonsStackView.heightAnchor.constraint(equalToConstant: 120.0),
            buttonsStackView.topAnchor.constraint(equalTo: leftStackView.bottomAnchor),
            buttonsStackView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        ])
    }
    
    private func openDatePicker(_ label: InteractLable) {
        var datePicker: CustomDatePicker?
        switch label.tag {
        case 0:
            datePicker = CustomDatePicker(date: viewOutput.dateFrom, frame: view.bounds)
            datePicker?.callback = { [weak self] date in
                self?.viewOutput.dateFrom = date
            }
        case 1:
            datePicker = CustomDatePicker(date: viewOutput.dateTo, frame: view.bounds)
            datePicker?.callback = { [weak self] date in
                self?.viewOutput.dateTo = date
            }
        default:
            break
        }
        if let picker = datePicker {
            view.addSubview(picker)
        }
    }
    
    // MARK: - Navigation

    var onBack: ((String?) -> Void)?
    var onTaskFormProjectsView: (() -> Void)?
    
    // MARK: - Actions
    
    @objc private func tappedOnElement(_ sender: UITapGestureRecognizer) {
        if let label = sender.view, label is InteractLable {
            switch label.tag {
            case 0, 1:
                // swiftlint:disable force_cast
                openDatePicker(label as! InteractLable)
            case 2:
                onTaskFormProjectsView?()
            case 3:
                showColorAlert()
            default:
                break
            }
        }
    }

}

// MARK: - TaskFormViewInput

extension TaskFormView: TaskFormViewInput {
    func show(message: String) {
        // Здесь показыаем алерт.
    }
    
    func close(message: String?) {
        onBack?(message)
    }
}

// MARK: - SaveCancelButtonsDelegate

extension TaskFormView: SaveCancelButtonsDelegate {
    func tappedCancel() {
        onBack?(nil)
    }
    
    func tappedSave() {
        // Здесь валидируем и передаём модель в презентер
    }
}

// MARK: - методы управления сдвигом при появлении клавиатуры

extension TaskFormView {
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(kbWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(kbWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            assertionFailure()
            return
        }
        // swiftlint:disable force_cast
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue)
            .cgRectValue
        scrollView.contentInset.bottom = kbFrameSize.height
    }
    
    @objc func kbWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = .zero
    }
}

// MARK: - UITextFieldDelegate

extension TaskFormView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            viewOutput.title = textField.text ?? ""
        case 1:
            viewOutput.description = textField.text ?? ""
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension TaskFormView {
    func showColorAlert() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let redActrion = UIAlertAction(title: "Red", style: .default) { (_) in
            self.viewOutput.color = "#FF7E79"
        }
        let blueActrion = UIAlertAction(title: "Blue", style: .default) { (_) in
            self.viewOutput.color = "#76D6FF"
        }
        let greenActrion = UIAlertAction(title: "Green", style: .default) { (_) in
            self.viewOutput.color = "#73FA79"
        }
        let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        
        let actions = [redActrion, blueActrion, greenActrion, closeAction]
        actions.forEach { alertController.addAction($0) }
        present(alertController, animated: true, completion: nil)
    }
}
