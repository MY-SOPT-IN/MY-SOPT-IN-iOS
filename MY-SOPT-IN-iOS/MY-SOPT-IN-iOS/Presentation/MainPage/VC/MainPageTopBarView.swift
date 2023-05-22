//
//  MainPageTopBarView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/18.
//

import UIKit

import SnapKit
import Then

final class MainPageTopBarView: UIView {

    // MARK: - Properties
    
    private let stackView = UIStackView()
    let routineLabel = UILabel()
    let recallLabel = UILabel()
    private let indicator = UIView()
    private let dividingLine = UIView()

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

        stackView.do {
            $0.backgroundColor = .Mono.white
            $0.axis = .horizontal
            $0.distribution = .fillEqually
        }
        
        routineLabel.do {
            $0.text = "루틴"
            $0.font = .title1Font()
            $0.textColor = .Gray.gray_700
            $0.textAlignment = .center
        }
        
        recallLabel.do {
            $0.text = "회고"
            $0.font = .title1Font()
            $0.textColor = .Gray.gray_700
            $0.textAlignment = .center
        }
        
        indicator.do {
            $0.backgroundColor = .Primary.primary_900
        }
        
        dividingLine.do {
            $0.backgroundColor = .Gray.gray_200
        }
    }
    
    private func setHierarchy() {

        self.addSubviews(stackView,
                         dividingLine)

        stackView.addArrangedSubviews(routineLabel,
                                 recallLabel)
        stackView.addSubview(indicator)
    }

    private func setLayout() {
        
        stackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(dividingLine.snp.top)
        }
    
        indicator.snp.makeConstraints {
            $0.height.equalTo(3)
            $0.width.equalTo(114)
            $0.bottom.equalToSuperview()
            $0.centerX.equalTo(routineLabel.snp.centerX)
        }
        
        dividingLine.snp.makeConstraints {
            $0.height.equalTo(1.5)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func updateIndicator(index: Int) {
        switch index {
        case 0:
            indicator.snp.remakeConstraints {
                $0.height.equalTo(3)
                $0.width.equalTo(114)
                $0.bottom.equalToSuperview()
                $0.centerX.equalTo(routineLabel.snp.centerX)
            }
            UIView.animate(withDuration: 0.2, animations: {
                self.layoutIfNeeded()
            })
        case 1:
            indicator.snp.remakeConstraints {
                $0.height.equalTo(3)
                $0.width.equalTo(114)
                $0.bottom.equalToSuperview()
                $0.centerX.equalTo(recallLabel.snp.centerX)
            }
            UIView.animate(withDuration: 0.2, animations: {
                self.layoutIfNeeded()
            })
        default:
            print("Paging Index Error")
        }
    }
}
