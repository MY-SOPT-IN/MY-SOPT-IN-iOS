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
        view.layer.cornerRadius = 25
        setBottomSheet()
        setupNavigationBar()
        
        bottomSheetView.editButton.addTarget(self, action: #selector(pushToEditRoutine), for: .touchUpInside)
        bottomSheetView.deleteButton.addTarget(self, action: #selector(presentToCustomAlert), for: .touchUpInside)
    }
    
    
    
    
    
    // MARK: - Setup
    
    private func setBottomSheet() {
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium(), .large()]
        }

        view.addSubview(bottomSheetView)
        bottomSheetView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(62)
            $0.leading.equalToSuperview().offset(33)
            $0.height.equalToSuperview()
            $0.width.equalTo(100)
        }
    }
    
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
        
        let closeButton = UIBarButtonItem(image: ImageLiterals.Icon.add_ic_x, style: .plain, target: self, action: #selector(dismissBottomSheet))
        closeButton.tintColor = UIColor.Gray.gray_900
        
        let navItem = UINavigationItem().then {
            $0.rightBarButtonItem = closeButton
        }
        
        navBar.setItems([navItem], animated: false)
    }
    
    // MARK: - Actions
    
    @objc
    private func dismissBottomSheet() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func pushToEditRoutine() {
        self.dismiss(animated: true) {
            self.delegate?.didTapButtonInBottomSheet() // 델리게이트 메서드 호출
        }
    }
    
    @objc
    private func presentToCustomAlert() {
        guard let presentingViewController = self.presentingViewController else { return }

        self.dismiss(animated: true) {
            let customAlertVC = CustomAlertViewController()
            customAlertVC.modalPresentationStyle = .overFullScreen
            presentingViewController.present(customAlertVC, animated: true, completion: nil)
        }
    }
}


