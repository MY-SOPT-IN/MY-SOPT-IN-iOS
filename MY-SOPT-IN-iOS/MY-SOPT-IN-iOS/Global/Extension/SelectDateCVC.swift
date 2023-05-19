//
//  SelectDateCVC.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class SelectDateCVC: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "SelectDateCell"
    
    var dayLabel = UILabel()
    var dateCircleView = UIView()
    var dateLabel = UILabel()
    
    let dateCircleSize: CGFloat = 34
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configCell() {
        
    }
    
    func setStyle() {
        
        dayLabel.do {
            $0.font = .bodyFont()
            $0.textColor = .Gray.gray_800
            $0.textAlignment = .center
        }
        
        dateCircleView.do {
            $0.makeRounded(radius: dateCircleSize / 2)
        }
        
        dateLabel.do {
            $0.font = .subtitleFont()
            $0.textColor = .Mono.white
            $0.textAlignment = .center
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(dayLabel,
                                dateCircleView)
        
        dateCircleView.addSubviews(dateLabel)
    }
    
    func setLayout() {
        
        dateCircleView.snp.makeConstraints {
            $0.height.equalTo(dateCircleSize)
            $0.width.equalTo(dateCircleSize)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        dayLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(dateCircleView.snp.top).offset(-2)
        }
        
        dateLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
