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
}
