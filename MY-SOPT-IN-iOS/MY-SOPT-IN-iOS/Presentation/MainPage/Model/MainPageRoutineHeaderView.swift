//
//  MainPageRoutineHeaderView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

class MainPageRoutineHeaderView: UIStackView {

    // MARK: - Properties

    private var selectDateView = SelectDateView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
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
        // MARK: - 뷰 확인용 색 지정
        selectDateView.backgroundColor = .Mono.white
        dateView.backgroundColor = .Gray.gray_100
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
    }
    
    // MARK: - @objc Function

}
