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
    
    lazy var editButton = makeButton(title: "수정하기", image: ImageLiterals.Icon.add_ic_edit)
    lazy var copyButton = makeButton(title: "복사하기", image: ImageLiterals.Icon.add_ic_copy)
    
    lazy var restButton = UIButton().then {
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
    
    lazy var completeButton = makeButton(title: "완료하기", image: ImageLiterals.Icon.add_ic_check)
    lazy var statisticsButton = makeButton(title: "월별 통계 보기", image: ImageLiterals.Icon.add_ic_bar)
    lazy var deleteButton = makeButton(title: "전체 삭제하기", image: ImageLiterals.Icon.add_ic_delete, tintColor: UIColor.Semantic.semantic_red)
    
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
        let buttonSpacing: CGFloat = 20  // 버튼 사이의 간격
        
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
            $0.leading.trailing.equalToSuperview()
        }
        
        copyButton.snp.makeConstraints {
            $0.top.equalTo(editButton.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview()
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
        
        // 버튼의 텍스트와 영역 모두를 눌러도 버튼이 눌리도록 설정
        let contentEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 150)
        editButton.contentEdgeInsets = contentEdgeInsets
        copyButton.contentEdgeInsets = contentEdgeInsets
        restButton.contentEdgeInsets = contentEdgeInsets
        completeButton.contentEdgeInsets = contentEdgeInsets
        statisticsButton.contentEdgeInsets = contentEdgeInsets
        deleteButton.contentEdgeInsets = contentEdgeInsets
    }
    
    private func makeButton(title: String, image: UIImage? = nil, tintColor: UIColor? = nil) -> UIButton {
        let button = UIButton().then {
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
            $0.titleLabel?.font = UIFont.bodyFont()
            $0.titleLabel?.lineBreakMode = .byWordWrapping
            $0.titleLabel?.numberOfLines = 0
            
            if let image = image {
                $0.setImage(image, for: .normal)
                $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
                $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
            }
            
            if let tintColor = tintColor {
                $0.tintColor = tintColor
            }
        }
        
        let attributedText = NSMutableAttributedString(string: title)
        if let newlineRange = title.range(of: "\n") {
            let location = title.distance(from: title.startIndex, to: newlineRange.lowerBound) + 1
            attributedText.addAttributes([.font: UIFont.body2Font(), .foregroundColor: UIColor.Gray.gray_700], range: NSRange(location: location, length: attributedText.length - location))
        }
        button.setAttributedTitle(attributedText, for: .normal)
        
        return button
    }
}

