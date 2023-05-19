//
//  MainPageRoutineHeaderView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

class MainPageRoutineHeaderView: UIStackView {

    // MARK: - Properties

    var selectDateView = SelectDateView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var dateView = UIView()
    
    private var dataLabel = UILabel()
    private var editFilterLabel = UILabel()
    
    // MARK: - View Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    
    private func setStyle() {
        self.axis = .vertical
        self.distribution = .fillEqually

        dataLabel.do {
            $0.text = "2023년 5월 19일"
            $0.font = .title2Font()
            $0.textColor = .Gray.gray_800
        }
        
        editFilterLabel.do {
            $0.text = " 편집 | 필터 "
            $0.font = .bodyFont()
            $0.textColor = .Gray.gray_500
        }
    }
    
    private func setLayout() {
        self.addArrangedSubviews(selectDateView,
                                 dateView)
        
        selectDateView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        dateView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        dateView.addSubviews(dataLabel,
                             editFilterLabel)
        
        dataLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        editFilterLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    // MARK: - @objc Function

}
