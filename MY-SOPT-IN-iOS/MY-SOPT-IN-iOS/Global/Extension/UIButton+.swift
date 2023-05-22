//
//  UIButton+.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

extension UIButton {
    
    func addSubtitle(_ subtitle: String, font: UIFont, color: UIColor) {
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = font
        subtitleLabel.textColor = color
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel!.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 4),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel!.trailingAnchor)
        ])
    }
    
    func addImageOnLeft(image: UIImage, text: String) {
        // 이미지 설정
        setImage(image, for: .normal)
        
        // 텍스트 설정
        setTitle(text, for: .normal)
        
        // 이미지와 텍스트 간격 조정
//        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
//        titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        // 버튼 스타일 설정 (옵션)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        // 버튼 크기 설정 (옵션)
        // 예시: 버튼 크기를 이미지와 텍스트에 맞게 자동 조정
        sizeToFit()
    }
}
