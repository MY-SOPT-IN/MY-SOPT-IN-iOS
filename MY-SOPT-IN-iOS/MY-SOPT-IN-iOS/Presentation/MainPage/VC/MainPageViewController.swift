//
//  MainPageViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

class MainPageViewController: UIViewController {

    // MARK: - Properties
    
    private var topBar = MainPageTopBarView()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }

    // MARK: - Methods
    
    func setStyle() {
        view.backgroundColor = .Gray.gray_50
    }
    func setLayout() {}

    // MARK: - @objc Function
    
    // MARK: - Network

}

