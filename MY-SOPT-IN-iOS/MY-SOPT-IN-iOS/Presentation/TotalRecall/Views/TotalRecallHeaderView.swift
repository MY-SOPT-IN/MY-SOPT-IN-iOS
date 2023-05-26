//
//  TotalRecallHeaderView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class TotalRecallHeaderView: UITableViewHeaderFooterView {

    var editButtonTappedClosure: (()-> Void)?
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023년 5월 7일"
        label.font = UIFont.title2Font()
        label.textColor = .Gray.gray_800
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icon.add_ic_edit, for: .normal)
        button.addTarget(self, action: #selector(editButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func editButtonDidTapped() {
        editButtonTappedClosure?()
    }
    
    func dataBind(date: String){
        dateLabel.text = date
    }
}

extension TotalRecallHeaderView {
    private func setLayout() {
        contentView.addSubviews(dateLabel, editButton)
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.leading.equalToSuperview().offset(16)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(dateLabel)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(7)
            $0.size.equalTo(16)
        }
    }
}

