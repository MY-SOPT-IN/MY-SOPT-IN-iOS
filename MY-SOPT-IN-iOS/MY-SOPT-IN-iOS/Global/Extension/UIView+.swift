//
//  UIView+.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/16.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
          clipsToBounds = true
          layer.cornerRadius = cornerRadius
          layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
      }
}
