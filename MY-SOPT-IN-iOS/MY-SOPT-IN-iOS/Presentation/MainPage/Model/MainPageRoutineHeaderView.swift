//
//  MainPageRoutineHeaderView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

class MainPageRoutineHeaderView: UIView {

    // MARK: - Properties

    let dateScrollView = UIScrollView()
    var previousSelectDateCollectionView = SelectDateCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var currentSelectDateCollectionView = SelectDateCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var nextSelectDateCollectionView = SelectDateCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var dateCollectionViews = [previousSelectDateCollectionView,
                                    currentSelectDateCollectionView,
                                    nextSelectDateCollectionView]
    
    private var dateView = UIView()
    var dateLabel = UILabel()
    private var editFilterLabel = UILabel()
    
    private let screenWidth = UIScreen.main.bounds.width
    
    // MARK: - View Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    
    private func setStyle() {
        
        dateScrollView.do {
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.contentSize.width = screenWidth * 3
        }

        dateLabel.do {
            $0.text = Dates.getDateString(Dates.getToday()!)()
            $0.font = .title2Font()
            $0.textColor = .Gray.gray_800
        }
        
        editFilterLabel.do {
            $0.text = " 편집 | 필터 "
            $0.font = .bodyFont()
            $0.textColor = .Gray.gray_500
        }
    }
    
    private func setHierarchy() {
        
        self.addSubviews(dateScrollView,
                                 dateView)
        
        dateScrollView.addSubviews(previousSelectDateCollectionView,
                                   currentSelectDateCollectionView,
                                   nextSelectDateCollectionView)
        
        dateView.addSubviews(dateLabel,
                             editFilterLabel)
    }
    
    private func setLayout() {
        
        dateScrollView.snp.makeConstraints {
            $0.height.equalTo(85)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        previousSelectDateCollectionView.snp.makeConstraints{
            $0.width.equalTo(screenWidth)
            $0.height.equalTo(85)
            $0.top.bottom.leading.equalToSuperview()
        }
        
        currentSelectDateCollectionView.snp.makeConstraints{
            $0.width.equalTo(screenWidth)
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(previousSelectDateCollectionView.snp.trailing)
        }
        
        nextSelectDateCollectionView.snp.makeConstraints{
            $0.width.equalTo(screenWidth)
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(currentSelectDateCollectionView.snp.trailing)
        }
                        
        dateView.snp.makeConstraints {
            $0.top.equalTo(dateScrollView.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        editFilterLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}
