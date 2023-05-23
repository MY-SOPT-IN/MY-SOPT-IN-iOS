//
//  RecallView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class RecallView: UIView {
    
    // MARK: - Properties
    
    let recallTextView = UITextView().then {
        $0.text = "오늘 루틴 어땠어요?"
        $0.textColor = UIColor.Gray.gray_400
        $0.font = UIFont.bodyFont()
        $0.backgroundColor = UIColor.Mono.white
        $0.textContainerInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 0)
        $0.contentInset = UIEdgeInsets(top: 14, left: 0, bottom: 0, right: 0)
    }
    
    let bestTextView = UITextView().then {
        $0.text = "오늘은 뭐가 가장 좋았어요?"
        $0.textColor = UIColor.Gray.gray_400
        $0.font = UIFont.bodyFont()
        $0.backgroundColor = UIColor.white
        $0.textContainerInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 0)
        $0.contentInset = UIEdgeInsets(top: 14, left: 0, bottom: 0, right: 0)
    }
    
    let wantsayTextView = UITextView().then {
        $0.text = "나에게 하고 싶은 말을 적어봐요:)"
        $0.textColor = UIColor.Gray.gray_400
        $0.font = UIFont.bodyFont()
        $0.backgroundColor = UIColor.white
        $0.textContainerInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 0)
        $0.contentInset = UIEdgeInsets(top: 14, left: 0, bottom: 0, right: 0)
    }
    
    private let recallLabel = UILabel().then {
        $0.text = "루틴 회고"
        $0.textColor = UIColor.Gray.gray_800
        $0.font = UIFont.subtitleFont()
    }
    
    private let todayLabel = UILabel().then {
        $0.text = "오늘 가장 좋았던 일"
        $0.textColor = UIColor.Gray.gray_800
        $0.font = UIFont.subtitleFont()
    }
    
    private let saymeLabel = UILabel().then {
        $0.text = "나에게 한마디"
        $0.textColor = UIColor.Gray.gray_800
        $0.font = UIFont.subtitleFont()
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        self.backgroundColor = UIColor.Gray.gray_50
        addSubviews(
            recallTextView,
            bestTextView,
            wantsayTextView,
            recallLabel,
            todayLabel,
            saymeLabel
        )
        self.snp.makeConstraints {
                $0.height.equalTo(495)
        }
        
        recallTextView.snp.makeConstraints {
            $0.width.equalTo(375)
            $0.height.equalTo(118)
            $0.top.equalToSuperview().offset(55)
        }
        
        bestTextView.snp.makeConstraints {
            $0.width.equalTo(375)
            $0.height.equalTo(118)
            $0.top.equalTo(recallTextView.snp.bottom).offset(50)
        }
        
        wantsayTextView.snp.makeConstraints {
            $0.width.equalTo(375)
            $0.height.equalTo(118)
            $0.top.equalTo(bestTextView.snp.bottom).offset(50)
        }
        
        recallLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalTo(recallTextView.snp.top).offset(-17)
        }
        
        todayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalTo(bestTextView.snp.top).offset(-17)
        }
        
        saymeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalTo(wantsayTextView.snp.top).offset(-17)
        }
    }
}
