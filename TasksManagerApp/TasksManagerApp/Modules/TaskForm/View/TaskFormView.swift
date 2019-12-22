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
    
    // MARK: - Private properties
    
    private let viewOutput: TaskFormViewOutput
    // Название экрана.
    private let titleScreenLabel: UILabel = {
        let label = UILabel()
        label.text = "Task"
        label.textAlignment = .center
        label.backgroundColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Название начальной даты.
    private let dateFromTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "DateFrom: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Начальная дата.
    private let dateFromLabel: UILabel = {
        let label = UILabel()
        label.text = "date"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Название конечной даты.
    private let dateToTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "DateTo: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Конечная дата.
    private let dateToLabel: UILabel = {
        let label = UILabel()
        label.text = "date"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Название тайтла.
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Тайтл.
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .green
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // Название описания.
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Описание.
    private let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .orange
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // Название поля проект.
    private let projectTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Project: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Проект.
    private let projectLabel: UILabel = {
        let label = UILabel()
        label.text = "project"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Название поля цвет.
    private let colorTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Color: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Цвет.
    private let colorLabel: UILabel = {
        let label = UILabel()
        label.text = "color"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Левый стек.
    private let leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
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
        titleTextField,
        descriptionTextField,
        projectLabel,
        colorLabel
    ]
    lazy var subViews = [
        titleScreenLabel,
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
    
    // MARK: - Private methods
    
    private func configure() {
        view.backgroundColor = .white
//        configureScrollView()
        addViews()
        assignDelegetes()
        setupConstraints()
    }
    
//    private func configureScrollView() {
//        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 500.0)
//    }
    
    private func addViews() {
        view.addSubview(scrollView)
        subViews.forEach { scrollView.addSubview($0) }
        leftStackViews.forEach { leftStackView.addArrangedSubview($0) }
        rightStackViews.forEach { rightStackView.addArrangedSubview($0) }
    }
    
    private func assignDelegetes() {
        buttonsStackView.delegate = self
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
            titleScreenLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            titleScreenLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleScreenLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            titleScreenLabel.heightAnchor.constraint(equalToConstant: 30.0),

            leftStackView.widthAnchor.constraint(equalToConstant: 100.0),
            leftStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            leftStackView.topAnchor.constraint(equalTo: titleScreenLabel.bottomAnchor, constant: 60.0),
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
    
    // MARK: - Navigation

    var onBack: ((String?) -> Void)?

}

// MARK: - TaskFormViewInput

extension TaskFormView: TaskFormViewInput {
    func setData(task: Task?) {
        // Здесь устанавливаем данные.
    }
    
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

extension TaskFormView {
    // MARK: - методы управления сдвигом при появлении клавиатуры
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
