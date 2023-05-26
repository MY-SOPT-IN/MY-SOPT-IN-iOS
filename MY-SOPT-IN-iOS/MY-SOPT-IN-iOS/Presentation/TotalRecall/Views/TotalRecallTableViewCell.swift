//
//  TotalRecallTableViewCell.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

enum RecallTitleStyle {
    case routineRecall
    case bestThing
    case selfMessage
    
    var title: String {
        switch self {
        case .routineRecall:
            return "루틴 회고"
        case .bestThing:
            return "오늘 가장 좋았던 일"
        case .selfMessage:
            return "나에게 한마디"
        }
    }
}

final class TotalRecallTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "타이틀라벨"
        label.font = UIFont.subtitleFont()
        label.textColor = .Gray.gray_800
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "디테일라벨"
        label.font = UIFont.bodyFont()
        label.textColor = .Gray.gray_500
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataBind(style: RecallTitleStyle, detail: String) {
        titleLabel.text = style.title
        detailLabel.text = detail
    }
    
}

extension TotalRecallTableViewCell {
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, detailLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(29)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(17)
            $0.leading.equalTo(titleLabel)
        }
    }
}
