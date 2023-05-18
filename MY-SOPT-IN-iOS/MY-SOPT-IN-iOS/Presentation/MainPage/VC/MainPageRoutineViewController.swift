//
//  MainPageRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/18.
//

import UIKit

import SnapKit
import Then

class MainPageRoutineViewController: UIViewController {
    
    // MARK: - Properties
    private var selectDateView = SelectDateView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var routineView = UITableView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    // MARK: - Methods
    
    func setStyle() {
        view.backgroundColor = .Gray.gray_50
        routineView.backgroundColor = .Mono.white
    }
    
    func setLayout() {
        view.addSubviews(selectDateView,
                         routineView)
        
        selectDateView.snp.makeConstraints {
            $0.height.equalTo(65)
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        routineView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.top.equalTo(selectDateView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
    }
    
    // MARK: - @objc Function
    
    // MARK: - Network
    
}
