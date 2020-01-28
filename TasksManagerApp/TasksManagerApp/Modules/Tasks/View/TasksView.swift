//
//  TasksView.swift
//  TasksManagerApp
//
//  Created by Oxana Lobysheva on 22/12/2019.
//  Copyright © 2019 TEAM (Lobysheva and Tolstikov and Semerikov). All rights reserved.
//

import UIKit

class TasksView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionview: UICollectionView!
    var cellId = "Cell"
    
    
        private var tasks : [TaskModel] = [
            TaskModel(id:  UUID(),
                      dates: Dates(Date(),Date()+10),
                      title: "Title 1 sdfsdfsdfsd sdfsdfsdf sdfsdfsdfsdf sdfsdfsdf sdfsdfsdfsdf sdfsdfsdfsdf dfsdfsdfsdf sdfsdfsdf sdfsdfsdf sdfdsfsdf",
                      body: "Body 1",
                      isComplete: false,
                      project: nil),
            TaskModel(id:  UUID(),
                      dates: Dates(Date()-2,Date()+11),
                      title: "Title 2",
                      body: "Body 2",
                      isComplete: false,
                      project: nil),
            TaskModel(id:  UUID(),
                      dates: Dates(Date()-3,Date()+12),
                      title: "Title 3",
                      body: "Body 3",
                      isComplete: false,
                      project: nil)
        ]
        private var projects : [String] = ["Project1", "Project2", "Project3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = .tmaColor
        }
        
        let navigationBar = TaskNavigationBar(
            frame: CGRect(x: 0,
                          y: 0,
                          width:  UIScreen.main.bounds.width,
                          height: 100)
        )
        self.view.addSubview(navigationBar)
        navigationBar.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0).isActive = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 150)
        
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(TaskCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        self.view.addSubview(collectionview)
    
        collectionview.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TaskCell
        return cell
    }

    func showDialog(text : String)
    {
        let alert = UIAlertController(title: "STUB for click", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}


class TaskCell: UICollectionViewCell {
    
    
    let taskImageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.setImage(UIImage(named: "TaskDefault"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.backgroundColor = .white
        label.text = "Here you will see a Task"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let delegateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        //label.text = "Delegate: Dartik"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let deadlineLabel: UILabel = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Deadline: \(dateFormatter.string(from: Date()))"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let completeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "CompleteButton"), for: .normal)
        //button.setTitle("Complete", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "EditButton"), for: .normal)
        //button.setTitle("Edit", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "DeleteButton"), for: .normal)
        //button.setTitle("Delete", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
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
        
        addSubview(taskImageButton)
        addSubview(taskLabel)
        addSubview(delegateLabel)
        addSubview(deadlineLabel)

        addSubview(completeButton)
        addSubview(deleteButton)
        addSubview(editButton)
        addSubview(stackView)

        taskImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        taskImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        taskImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        taskImageButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        taskLabel.leftAnchor.constraint(equalTo: taskImageButton.rightAnchor, constant: 10).isActive = true
        taskLabel.centerYAnchor.constraint(equalTo: taskImageButton.centerYAnchor, constant: -10).isActive = true
        taskLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        deadlineLabel.leftAnchor.constraint(equalTo: taskLabel.leftAnchor).isActive = true
        deadlineLabel.centerYAnchor.constraint(equalTo: taskImageButton.centerYAnchor, constant: 18).isActive = true
        deadlineLabel.widthAnchor.constraint(equalToConstant: 100)
        
        delegateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        delegateLabel.centerYAnchor.constraint(equalTo: delegateLabel.centerYAnchor).isActive = true
        
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
