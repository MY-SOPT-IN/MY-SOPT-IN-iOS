//
//  UILabel+.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/16.
//

import UIKit

extension UILabel {
    
    // UILabel의 일부 text 색상을 바꿔주는 함수
    // targetString의 text를 color로 바꿔줌
    func asColor(targetString: String, color: UIColor?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
}
