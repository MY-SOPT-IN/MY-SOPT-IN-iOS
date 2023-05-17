//
//  BottomSheetViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

class BottomSheetViewController: UIViewController {
    
    // MARK: - Properties
    
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
        }
    }
    
    // MARK: - setUI
    
    private func setupNavigationBar() {
        let navBar = UINavigationBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        
        navBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        
        let closeButton = UIBarButtonItem(image: ImageLiterals.Icon.add_ic_x, style: .plain, target: self, action: #selector(closeButtonTapped))
        closeButton.tintColor = UIColor.Gray.gray_900
        
        let navItem = UINavigationItem()
        navItem.rightBarButtonItem = closeButton
        
        navBar.setItems([navItem], animated: false)
    }
    
    // MARK: - Actions
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
