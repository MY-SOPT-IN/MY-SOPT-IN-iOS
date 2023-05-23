//
//  CustomAlertViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/19.
//
import UIKit

import SnapKit
import Then

final class CustomAlertViewController: UIViewController {
    
    // MARK: - Properties
    
    private let alertView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    private let imageView = UIImageView().then {
        $0.image = ImageLiterals.AlertImage.exclamation
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "모든 기록이 삭제돼요"
        $0.textAlignment = .center
        $0.font = UIFont.subtitleFont()
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = "지금까지의 루틴 기록이 영구적으로\n지워져요. 그래도 삭제할래요?"
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.textColor = UIColor.Gray.gray_800
        $0.font = UIFont.body2Font()
    }
    
    private lazy var cancelButton = UIButton().then {
        $0.setTitle("아니", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.body2Font()
        let action = UIAction { [weak self] _ in
            self?.dismissCustomAlert()
        }
        $0.addAction(action, for: .touchUpInside)
    }
    
    private lazy var deleteButton = UIButton().then {
        $0.setTitle("삭제할래", for: .normal)
        $0.titleLabel?.font = UIFont.body2Font()
        $0.setTitleColor(UIColor.Semantic.semantic_red, for: .normal)
        let action = UIAction{ [weak self] _ in
            self?.touchdeleteButton()
        }
        $0.addAction(action, for: .touchUpInside)
    }
    
    private let verticalWall = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_100
    }
    
    private let horizontalWall = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_100
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
         
        view.backgroundColor = UIColor(white: 0, alpha: 0.5) // 반투명한 검은색 배경 추가
        view.addSubview(alertView)
        
        alertView.addSubviews(
            imageView,
            titleLabel,
            subtitleLabel,
            cancelButton,
            deleteButton,
            horizontalWall,
            verticalWall
        )
        
        alertView.snp.makeConstraints {
            $0.width.equalTo(250)
            $0.height.equalTo(264)
            $0.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(38)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(49)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(125)
            $0.height.equalTo(53)
        }
        
        deleteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(125)
            $0.height.equalTo(53)
        }
        
        horizontalWall.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalTo(cancelButton.snp.top)
            $0.trailing.leading.equalToSuperview()
        }

        verticalWall.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.top.equalTo(horizontalWall.snp.top)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    private func dismissCustomAlert() {
        dismiss(animated: true, completion: nil)
    }
    
    private func touchdeleteButton() {
        // 삭제 버튼 액션 처리
        dismiss(animated: true, completion: nil)
    }
}
