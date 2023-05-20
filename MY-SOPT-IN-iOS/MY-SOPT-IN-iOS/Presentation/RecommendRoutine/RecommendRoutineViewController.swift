//
//  RecommendRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class RecommendRoutineViewController: UIViewController {
    
    private lazy var moreButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("모아보기", for: .normal)
        btn.addTarget(self, action: #selector(moreButtonDidTapped), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        view.backgroundColor = .black
    }
    
    @objc
    private func moreButtonDidTapped() {
        let totalRoutineVC = TotalRoutineViewController()
        navigationController?.pushViewController(totalRoutineVC, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}

extension RecommendRoutineViewController {
    private func setLayout() {
        view.addSubviews(moreButton)
        
        moreButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
