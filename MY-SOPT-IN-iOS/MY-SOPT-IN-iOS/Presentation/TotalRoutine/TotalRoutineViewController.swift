//
//  TotalRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class TotalRoutineViewController: UIViewController {
    
    private let naviBar = UIView()
    private let backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(ImageLiterals.Icon.add_ic_arrow, for: .normal)
        return btn
    }()
    private let naviTitle: UILabel = {
        let label = UILabel()
        label.text = "회고 모아보기"
        label.font = UIFont.title1Font()
        label.textColor = .Gray.gray_900
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setLayout()
    }
}

extension TotalRoutineViewController {
    
    private func setBackgroundColor() {
        view.backgroundColor = UIColor.Gray.gray_100
    }
    
    private func setLayout() {
        view.addSubviews(naviBar)
        naviBar.addSubviews(backButton, naviTitle)
        
        naviBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(54)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(17)
            $0.width.equalTo(10)
        }
        
        naviTitle.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
