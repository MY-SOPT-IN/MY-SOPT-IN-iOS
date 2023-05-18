//
//  BottomSheetView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

class BottomSheetView: UIView {
    
    // MARK: - UI Components
    
    let editButton = UIButton().then {
        $0.setTitle("수정하기", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.bodyFont()
        $0.setImage(ImageLiterals.Icon.add_ic_edit, for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
    }
    
    let copyButton = UIButton().then {
        $0.setTitle("복사하기", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.bodyFont()
        $0.setImage(ImageLiterals.Icon.add_ic_copy, for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
    }
    
    let restButton = UIButton().then {
        $0.setTitle("쉬어가기 \n'쉬고 있는 루틴'에 넣어두고 당분간 하지 않아요", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.bodyFont()
        $0.titleLabel?.lineBreakMode = .byWordWrapping
        $0.titleLabel?.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: $0.currentTitle ?? "")
        let newlineRange = ($0.currentTitle as NSString?)?.range(of: "\n")
        
        if let range = newlineRange {
            attributedText.addAttributes([.font: UIFont.body2Font(), .foregroundColor: UIColor.Gray.gray_700], range: NSRange(location: range.location + 1, length: attributedText.length - range.location - 1))
        }
        
        $0.setAttributedTitle(attributedText, for: .normal)
        
        $0.setImage(ImageLiterals.Icon.add_ic_leaf, for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
    }

    
    let completeButton = UIButton().then {
        $0.setTitle("완료하기", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.bodyFont()
        $0.setImage(ImageLiterals.Icon.add_ic_check, for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
    }
    
    let statisticsButton = UIButton().then {
        $0.setTitle("월별 통계 보기", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.bodyFont()
        $0.setImage(ImageLiterals.Icon.add_ic_bar, for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
    }
    
    let deleteButton = UIButton().then {
        $0.setTitle("전체 삭제하기", for: .normal)
        $0.setTitleColor(UIColor.Semantic.semantic_red, for: .normal)
        $0.titleLabel?.font = UIFont.bodyFont()
        let deleteImage = ImageLiterals.Icon.add_ic_delete?.withRenderingMode(.alwaysTemplate)
        $0.setImage(deleteImage, for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
        $0.tintColor = UIColor.Semantic.semantic_red
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    // MARK: - Setup
    
    private func setupSubviews() {
        addSubviews(
            editButton,
            copyButton,
            restButton,
            completeButton,
            statisticsButton,
            deleteButton
        )
        
        editButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        copyButton.snp.makeConstraints {
            $0.top.equalTo(editButton.snp.bottom).offset(36)
            $0.leading.equalToSuperview()
        }
        
        restButton.snp.makeConstraints {
            $0.top.equalTo(copyButton.snp.bottom).offset(36)
            $0.leading.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints {
            $0.top.equalTo(restButton.snp.bottom).offset(48)
            $0.leading.equalToSuperview()
        }
        
        statisticsButton.snp.makeConstraints {
            $0.top.equalTo(completeButton.snp.bottom).offset(36)
            $0.leading.equalToSuperview()
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalTo(statisticsButton.snp.bottom).offset(36)
            $0.leading.equalToSuperview()
        }
    }
}
