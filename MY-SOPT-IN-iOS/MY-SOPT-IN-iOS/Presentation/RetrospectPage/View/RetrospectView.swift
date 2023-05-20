//
//  RetrospectView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class RetrospectView: UIView{
    
    private let retrospectLabel = UILabel().then{
        $0.textColor = UIColor.Gray.gray_800
        $0.font = UIFont.subtitleFont()
    }
    
    private let RetrospectTextview = UITextView(frame: CGRect(x: 0, y: 0, width: 375, height: 118)).then{
        $0.font = UIFont.bodyFont()
        $0.backgroundColor = .white
    }
    
    // MARK: - Initialization
    
    init(_ title: String, _ retrospect: String) {
        super.init(frame: .zero)
        setUI(title, retrospect)
        backgroundColor = UIColor.Gray.gray_50
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(_ title: String, _ retrospect: String){
        self.retrospectLabel.text = title
        self.RetrospectTextview.text = retrospect
    }
}
