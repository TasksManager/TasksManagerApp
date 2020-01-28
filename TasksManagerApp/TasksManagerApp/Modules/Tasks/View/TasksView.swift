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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = .tmaColor
        
        let navigationBar = TaskNavigationBar(
            frame: CGRect(x: 0,
                          y: 0,
                          width:  UIScreen.main.bounds.width,
                          height: 100)
        )
        self.view.addSubview(navigationBar)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 100)
        
        collectionview = UICollectionView(
            frame: CGRect(x: 0,
                          y: 100,
                          width:  UIScreen.main.bounds.width,
                          height: self.view.frame.height-100),
            collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(TaskCellView.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        self.view.addSubview(collectionview)
    
        collectionview.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 10).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TaskCellView
        cell.makeDashedBorderLine()
        return cell
    }

    func showDialog(text : String)
    {
        let alert = UIAlertController(title: "STUB for click", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}


