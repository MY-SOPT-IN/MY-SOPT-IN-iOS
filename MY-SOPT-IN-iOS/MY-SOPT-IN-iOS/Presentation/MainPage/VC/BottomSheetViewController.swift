//
//  BottomSheetViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/16.
//
import UIKit

import SnapKit
import Then

protocol BottomSheetDelegate: AnyObject {
    func didTapButtonInBottomSheet()
}


class BottomSheetViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: BottomSheetDelegate?
    private let bottomSheetView = BottomSheetView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium(), .large()]
        }
        
        view.addSubview(bottomSheetView)
        bottomSheetView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(62)
            $0.leading.equalToSuperview().offset(33)
            $0.height.equalToSuperview()
        }
        
        bottomSheetView.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
    
    
    
    
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        let navBar = UINavigationBar().then {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        view.addSubview(navBar)
        
        navBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        
        let closeButton = UIBarButtonItem(image: ImageLiterals.Icon.add_ic_x, style: .plain, target: self, action: #selector(closeButtonTapped))
        closeButton.tintColor = UIColor.Gray.gray_900
        
        let navItem = UINavigationItem().then {
            $0.rightBarButtonItem = closeButton
        }
        
        navBar.setItems([navItem], animated: false)
    }
    
    // MARK: - Actions
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func editButtonTapped() {
        self.dismiss(animated: true) {
            self.delegate?.didTapButtonInBottomSheet() // 델리게이트 메서드 호출
        }
    }
}

// VC2가 dismiss 되었을 때 VC1이 알게 한다.
// VC1
