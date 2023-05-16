//
//  UITextField+.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/16.
//

import UIKit

extension UITextField {
    
    // Placeholder 색상 지정
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
    // TextField 좌우 여백 (기본 값 좌우 22씩)
    func setLeftRightPadding(leftPadding: Double = 22.0, rightPadding: Double = 22.0) {
        let leftPaddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: leftPadding, height: 0.0))
        let rightPaddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: rightPadding, height: 0.0))
        
        self.leftView = leftPaddingView
        self.rightView = rightPaddingView
        
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
