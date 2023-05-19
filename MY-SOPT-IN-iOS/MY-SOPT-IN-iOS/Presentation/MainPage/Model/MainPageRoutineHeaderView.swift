//
//  MainPageRoutineHeaderView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

class MainPageRoutineHeaderView: UIStackView {

    // MARK: - Properties

    var selectDateView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var dateView = UIView()
    private var dateLabel = UILabel()
    private var editFilterLabel = UILabel()
    
    let flowLayout = UICollectionViewFlowLayout()
    let itemSpacing: CGFloat = 16
    private let itemCount: Int = 7
    
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
        
        selectDateView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.collectionViewLayout = flowLayout
        }
        
        flowLayout.do{
            $0.itemSize = CGSize(width: ((UIScreen.main.bounds.width - itemSpacing * CGFloat(itemCount + 1)) / CGFloat(itemCount)) , height: 65)
            $0.minimumLineSpacing = itemSpacing
            $0.scrollDirection = .horizontal
            $0.headerReferenceSize = CGSize(width: itemSpacing, height: 65)
            $0.footerReferenceSize = CGSize(width: itemSpacing, height: 65)
        }

        dateLabel.do {
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
        
        dateView.addSubviews(dateLabel,
                             editFilterLabel)
        
        dateLabel.snp.makeConstraints {
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
