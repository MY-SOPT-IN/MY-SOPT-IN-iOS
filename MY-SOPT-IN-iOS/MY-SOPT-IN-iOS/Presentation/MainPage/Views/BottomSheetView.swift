//
//  BottomSheetView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class BottomSheetView: UIView {
    
    // MARK: - UI Components
    
    lazy var editButton = makeButton(
        title: "수정하기",
        image: ImageLiterals.Icon.add_ic_edit,
        imageSize: CGSize(width: 16, height: 16)

    )
    
    private lazy var copyButton = makeButton(
        title: "복사하기",
        image: ImageLiterals.Icon.add_ic_copy,
        imageSize: CGSize(width: 19, height: 19)
    )
    
    private lazy var restButton = UIButton().then {
        $0.setTitle("쉬어가기 \n'쉬고 있는 루틴'에 넣어두고 당분간 하지 않아요", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.bodyFont()
        $0.titleLabel?.lineBreakMode = .byWordWrapping
        $0.titleLabel?.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: $0.currentTitle ?? "")
        let newlineRange = ($0.currentTitle as NSString?)?.range(of: "\n")
        
        if let range = newlineRange {
            attributedText.addAttributes(
                [.font: UIFont.body2Font(),
                .foregroundColor: UIColor.Gray.gray_700],
                range: NSRange(location: range.location + 1,
                               length: attributedText.length - range.location - 1)
            )
        }
        
        $0.setAttributedTitle(attributedText, for: .normal)
        
        let restImage = ImageLiterals.Icon.add_ic_leaf?.resize(to: CGSize(width: 14, height: 14))
        $0.setImage(restImage, for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
    }
    
    private lazy var completeButton = makeButton(
        title: "완료하기",
        image: ImageLiterals.Icon.add_ic_check,
        imageSize: CGSize(width: 14, height: 14)

    )
    
    private lazy var statisticsButton = makeButton(
        title: "월별 통계 보기",
        image: ImageLiterals.Icon.add_ic_bar,
        imageSize: CGSize(width: 16, height: 16)

    )
    
    lazy var deleteButton = UIButton().then {
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
    
    // MARK: - setUI
    
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
    
    private
    func makeButton(title: String, image: UIImage? = nil, imageSize: CGSize? = nil, tintColor: UIColor? = nil) -> UIButton {
        let button = UIButton().then {
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
            $0.titleLabel?.font = UIFont.bodyFont()
            $0.titleLabel?.lineBreakMode = .byWordWrapping
            $0.titleLabel?.numberOfLines = 0
            
            if let image = image {
                var resizedImage: UIImage?
                if let imageSize = imageSize {
                    resizedImage = image.resize(to: imageSize)
                } else {
                    resizedImage = image
                }
                $0.setImage(resizedImage, for: .normal)
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
            attributedText.addAttributes([.font: UIFont.bodyFont(), .foregroundColor: UIColor.Gray.gray_700], range: NSRange(location: location, length: attributedText.length - location))
        }
        button.setAttributedTitle(attributedText, for: .normal)
        
        return button
    }

}

