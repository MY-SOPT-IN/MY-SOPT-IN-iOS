//
//  RecallFooterView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

final class RecallFooterView: UITableViewHeaderFooterView {
    
    let saveButton = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.body2Font()
        $0.backgroundColor = UIColor.Primary.primary
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.Primary.primary_700.cgColor
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .Gray.gray_50
        addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(69)
            $0.height.equalTo(42)
        }
        
        contentView.layer.borderWidth = 0  // 테두리 제거
        contentView.layer.borderColor = UIColor.clear.cgColor
    }
}
