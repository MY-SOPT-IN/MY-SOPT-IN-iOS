//
//  RetrospectViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/19.
//
import UIKit

import SnapKit
import Then


class RecallViewController: UIViewController {
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    private let contentView = UIView()
    
    private let recallView = RecallView()
    
    private let privateButton = UIButton().then {
        $0.setImage(ImageLiterals.RecallProperty.defaultRecall, for: .normal)
    }
    
    private let recalldateLabel = UILabel().then {
        $0.text = "2023년 5월 7일"
        $0.font = UIFont.title2Font()
        $0.textColor = UIColor.Gray.gray_800
    }
    
    private let moreLabel = UIButton().then {
        $0.setTitle("회고 모아보기", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_800, for: .normal)
        $0.titleLabel?.font = UIFont.subtitleFont()
        let deleteImage = ImageLiterals.RecallProperty.moreRecall
        $0.setImage(deleteImage, for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 6)
        $0.addTarget(self, action: #selector(pushToEditRecall), for: .touchUpInside)

    }
    
    private let saveButton = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.body2Font()
        $0.backgroundColor = UIColor.Primary.primary
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.Primary.primary_700.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Gray.gray_50
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            recalldateLabel,
            moreLabel,
            recallView,
            privateButton,
            saveButton
        )
        
        recallView.recallTextView.delegate = self
        recallView.bestTextView.delegate = self
        recallView.wantsayTextView.delegate = self
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(710) // 스크롤 뷰의 높이 설정
        }
        
        recalldateLabel.snp.makeConstraints {
            $0.bottom.equalTo(recallView.recallTextView.snp.top).offset(-57)
            $0.leading.equalToSuperview().offset(16)
        }
        
        moreLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-19)
            $0.centerY.equalTo(recalldateLabel)
        }
        
        recallView.snp.makeConstraints {
            $0.top.equalTo(recalldateLabel.snp.bottom).offset(57)
            $0.leading.trailing.equalToSuperview()
        }
        
        privateButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            $0.bottom.equalTo(recallView.recallTextView.snp.top).offset(-10)
        }
        
        saveButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(26)
            $0.top.equalTo(recallView.wantsayTextView.snp.bottom).offset(17)
            $0.width.equalTo(69)
            $0.height.equalTo(42)
        }
    }
    
    @objc
    private func pushToEditRecall() {
        let editreacallViewController = EditRecallViewController()
        editreacallViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(editreacallViewController, animated: true)
    }
    
}



extension RecallViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == recallView.recallTextView {
            if textView.textColor == .Gray.gray_400 {
                textView.text = nil
                textView.textColor = .black
            }
        } else if textView == recallView.bestTextView {
            if textView.textColor == .Gray.gray_400 {
                textView.text = nil
                textView.textColor = .black
            }
        }
        else if textView == recallView.wantsayTextView {
            if textView.textColor == .Gray.gray_400 {
                textView.text = nil
                textView.textColor = .black
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == recallView.recallTextView {
            if textView.text.isEmpty {
                textView.text = "오늘 루틴 어땠어요?"
                textView.textColor = UIColor.Gray.gray_400
            }
        } else if textView == recallView.bestTextView {
            if textView.text.isEmpty {
                textView.text = "오늘은 뭐가 가장 좋았어요?"
                textView.textColor = UIColor.Gray.gray_400
            }
        } else if textView == recallView.wantsayTextView {
            if textView.text.isEmpty {
                textView.text = "나에게 하고 싶은 말을 적어봐요 :)"
                textView.textColor = UIColor.Gray.gray_400
            }
        }
    }
}
