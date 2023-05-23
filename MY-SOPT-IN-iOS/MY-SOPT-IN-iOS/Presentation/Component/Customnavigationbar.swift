//
//  Customnavigationbar.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class Customnavigationbar: UIView {

    // MARK: - UI Components

    private let navigationView = UIView().then {
        $0.backgroundColor = .white
    }
    
     let navigationBack = UIButton().then {
        $0.setImage(ImageLiterals.Icon.add_ic_arrow, for: .normal)
    }
    
     let navigationTitle = UILabel().then {
        $0.font = UIFont.title1Font()
        $0.textColor = UIColor.Gray.gray_900
    }
    
    // MARK: - Initialization

    init(_ title: String) {
        super.init(frame: .zero)
        setUI(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setUI
    
    func setUI(_ title: String){
        self.navigationTitle.text = title
        addSubviews(
            navigationView,
            navigationBack,
            navigationTitle
        )
        navigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        navigationBack.snp.makeConstraints{
            $0.top.equalTo(navigationView.snp.top).offset(12)
            $0.leading.equalTo(navigationView.snp.leading).offset(16)
        }
        
        navigationTitle.snp.makeConstraints{
            $0.top.equalTo(navigationView.snp.top).offset(12)
            $0.centerX.equalTo(navigationView)
        }
    }
}
