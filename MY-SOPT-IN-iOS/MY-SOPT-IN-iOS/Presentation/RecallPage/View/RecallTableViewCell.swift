//
//  RecallTableViewCell.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

final class RecallTableViewCell: UITableViewCell {
    
    let recallView = RecallView().then {
        $0.snp.makeConstraints {
            $0.height.equalTo(495)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(recallView)
        recallView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(contentView).offset(-8)
        }
    }
}
