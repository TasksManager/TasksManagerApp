//
//  ProjectFormView.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class ProjectFormView: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Dependency
    private let viewOutput: ProjectFormViewOutput
    
    // MARK: - Constants
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    private let scrollView = UIScrollView()
    private let mainView = UIView()
    private let backButton = UIButton()
    private let topLabel = UILabel()
    private let projectNameLabel = UILabel()
    private let projectColorLabel = UILabel()
    private let projectNameTextField = UITextField()
    private let projectColorTextField = UITextField()
    private let saveButton = UIButton()
    private var keyboardHeight: CGFloat = 0
    private var isKeyboardShown = false
    
    // MARK: - Init
    init(_ presenter: ProjectFormViewOutput) {
        self.viewOutput = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tmaColor
        setupBackButton()
        setupTopLabel()
        setupScrollView()
        setupMainView()
        setupProjectNameLabel()
        setupProjectColorLabel()
        setupProjectNameTextField()
        setupProjectColorTextField()
        setupSaveButton()
        viewOutput.didAppear()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self,
                                                         action: #selector(hideKeyboard))
        mainView.addGestureRecognizer(hideKeyboardGesture)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown​),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Puplic methods
    // MARK: - Private methods
    private func setupBackButton() {
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        backButton.titleLabel?.font = .systemFontOfSize(size: 16)
        backButton.titleLabel?.textColor = .tmaWhiteColor
        backButton.setTitle("〈 Back", for: .normal)
        view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        let leadingConstraint = backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        let widthConstraint = backButton.widthAnchor.constraint(equalToConstant: 60)
        let heightConstraint = backButton.heightAnchor.constraint(equalToConstant: 40)
        view.addConstraints([topConstraint, leadingConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupTopLabel() {
        topLabel.font = .systemFontOfSize(size: 26)
        topLabel.textColor = .tmaWhiteColor
        topLabel.text = "ADD NEW PROJECT"
        topLabel.textAlignment = .center
        topLabel.numberOfLines = 1
        view.addSubview(topLabel)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        let horizontalConstraint = topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let widthConstraint = topLabel.widthAnchor.constraint(equalToConstant: width - 140)
        let heightConstraint = topLabel.heightAnchor.constraint(equalToConstant: 40)
        view.addConstraints([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: width, height: 750)
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        let leadingConstraint = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let widthConstraint = scrollView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        let heightConstraint = scrollView.heightAnchor.constraint(equalToConstant: view.frame.size.height)
        view.addConstraints([topConstraint, leadingConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupMainView() {
        mainView.backgroundColor = .white
        scrollView.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        let leadingConstraint = mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottomConstraint = mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        view.addConstraints([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    }
    
    private func setupProjectNameLabel() {
        projectNameLabel.font = .systemFontOfSize(size: 16)
        projectNameLabel.textColor = .tmaGrayColor
        projectNameLabel.text = "Title"
        projectNameLabel.textAlignment = .left
        projectNameLabel.numberOfLines = 1
        mainView.addSubview(projectNameLabel)
        
        projectNameLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = projectNameLabel.topAnchor.constraint(equalTo: mainView.topAnchor,
                                                                  constant: 20)
        let leadingConstraint = projectNameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,
                                                                          constant: 15)
        let widthConstraint = projectNameLabel.widthAnchor.constraint(equalToConstant: 80)
        let heightConstraint = projectNameLabel.heightAnchor.constraint(equalToConstant: 20)
        mainView.addConstraints([leadingConstraint, topConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupProjectColorLabel() {
        projectColorLabel.font = .systemFontOfSize(size: 16)
        projectColorLabel.textColor = .tmaGrayColor
        projectColorLabel.text = "Color"
        projectColorLabel.textAlignment = .left
        projectColorLabel.numberOfLines = 1
        mainView.addSubview(projectColorLabel)
        
        projectColorLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = projectColorLabel.topAnchor.constraint(equalTo: projectNameLabel.bottomAnchor,
                                                                   constant: 20)
        let leadingConstraint = projectColorLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,
                                                                           constant: 15)
        let widthConstraint = projectColorLabel.widthAnchor.constraint(equalToConstant: 80)
        let heightConstraint = projectColorLabel.heightAnchor.constraint(equalToConstant: 20)
        mainView.addConstraints([leadingConstraint, topConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupProjectNameTextField() {
        let newColor = UIColor.tmaColor.cgColor
        projectNameTextField.layer.borderColor = newColor
        projectNameTextField.layer.borderWidth = 2
        projectNameTextField.layer.cornerRadius = 5
        projectNameTextField.font = .systemFontOfSize(size: 16)
        projectNameTextField.textColor = .tmaGrayColor
        projectNameTextField.placeholder = "Input title for project"
        projectNameTextField.leftView = UIView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: 5,
                                                             height: projectNameTextField.frame.height))
        projectNameTextField.leftViewMode = .always
        mainView.addSubview(projectNameTextField)
        
        projectNameTextField.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = projectNameTextField.topAnchor.constraint(equalTo: mainView.topAnchor,
                                                                      constant: 14)
        let leadingConstraint = projectNameTextField.leadingAnchor.constraint(equalTo: projectNameLabel.trailingAnchor,
                                                                              constant: 10)
        let trailingConstraint = projectNameTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,
                                                                                constant: -15)
        let heightConstraint = projectNameTextField.heightAnchor.constraint(equalToConstant: 32)
        mainView.addConstraints([leadingConstraint, topConstraint, trailingConstraint, heightConstraint])
    }
    
    private func setupProjectColorTextField() {
        let newColor = UIColor.tmaColor.cgColor
        projectColorTextField.layer.borderColor = newColor
        projectColorTextField.layer.borderWidth = 2
        projectColorTextField.layer.cornerRadius = 5
        projectColorTextField.font = .systemFontOfSize(size: 16)
        projectColorTextField.textColor = .tmaGrayColor
        projectColorTextField.placeholder = "Input color for project"
        projectColorTextField.leftView = UIView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: 5,
                                                             height: projectColorTextField.frame.height))
        projectColorTextField.leftViewMode = .always
        mainView.addSubview(projectColorTextField)
        
        projectColorTextField.translatesAutoresizingMaskIntoConstraints = false
        let topConstr = projectColorTextField.topAnchor.constraint(equalTo: projectNameTextField.bottomAnchor,
                                                                   constant: 8)
        let leadingConstr = projectColorTextField.leadingAnchor.constraint(equalTo: projectColorLabel.trailingAnchor,
                                                                           constant: 10)
        let trailingConstr = projectColorTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,
                                                                             constant: -15)
        let heightConstr = projectColorTextField.heightAnchor.constraint(equalToConstant: 32)
        mainView.addConstraints([leadingConstr, topConstr, trailingConstr, heightConstr])
    }
    
    private func setupSaveButton() {
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        saveButton.titleLabel?.font = .systemFontOfSize(size: 26)
        saveButton.backgroundColor = .tmaColor
        saveButton.titleLabel?.textColor = .tmaWhiteColor
        saveButton.setTitle("SAVE PROJECT", for: .normal)
        saveButton.layer.cornerRadius = 5
        mainView.addSubview(saveButton)
        
        saveButton.isAccessibilityElement = true
        saveButton.accessibilityIdentifier = "saveButton"
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        let bottomConstraint = saveButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,
                                                                  constant: -15)
        let leadingConstraint = saveButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,
                                                                    constant: 15)
        let trailingConstraint = saveButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,
                                                                      constant: -15)
        let heightConstraint = saveButton.heightAnchor.constraint(equalToConstant: 45)
        mainView.addConstraints([bottomConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
    
    private func animateSaveButtonMoving(up: Bool, moveValue: CGFloat) {
        let movementDuration: TimeInterval = 0.3
        let movement: CGFloat = (up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        saveButton.frame = saveButton.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    // MARK: - IBActions
    @objc private func backButtonPressed() {
        onBack?(nil)
    }
    
    @objc private func saveButtonPressed() {
        guard let title = projectNameTextField.text, let color = projectColorTextField.text else { return }
        viewOutput.addProject(title: title, color: color)
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
    @objc func keyboardWasShown​(notification: Notification) {
        guard let info = notification.userInfo else {
            assertionFailure()
            return
        }
        //swiftlint:disable force_cast
        let kbSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        keyboardHeight = kbSize.height
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        if !isKeyboardShown {
            animateSaveButtonMoving(up: true, moveValue: keyboardHeight)
            isKeyboardShown = true
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        if isKeyboardShown {
            animateSaveButtonMoving(up: false, moveValue: keyboardHeight)
            isKeyboardShown = false
        }
    }
    
    // MARK: - Buttons methods
    // MARK: - Navigation
    var onBack: ((String?) -> Void)?
    
}

extension ProjectFormView: ProjectFormViewInput {
    
    func setData(project: Project?) {
        guard let title = project?.title else { return }
        topLabel.text = title
        projectNameTextField.text = title
        projectColorTextField.text = project?.color
    }
    
    func show(message: String) {
        // Здесь показыаем алерт.
    }
    
    func close(message: String?) {
        onBack?(nil)
    }
}
