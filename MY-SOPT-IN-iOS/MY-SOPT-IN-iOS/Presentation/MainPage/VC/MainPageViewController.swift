//
//  MainPageViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

class MainPageViewController: UIViewController, BottomSheetDelegate {
    
    // MARK: - Properties
    
    let tabcell = UIButton().then {
        $0.setTitle("일단 바텀시트 올라오는 버튼", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.addTarget(self, action: #selector(presentToBottomSheet), for: .touchUpInside)
    }
    
    let addButton = UIButton().then {
        $0.setImage(ImageLiterals.Icon.add_ic_addButton, for: .normal)
        $0.addTarget(self, action: #selector(pushToAddRoutine), for: .touchUpInside)
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(
            tabcell,
            addButton
        )

        tabcell.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        addButton.snp.makeConstraints {
            $0.top.equalTo(tabcell.snp.bottom).offset(30)
            $0.centerX.equalTo(tabcell)
        }
    }
    
    // MARK: - BottomSheetDelegate
    
    func showBottomSheet() {
        let bottomSheet = BottomSheetViewController()
        bottomSheet.delegate = self
        present(bottomSheet, animated: true, completion: nil)
    }
    
    func didTapButtonInBottomSheet() {
        let editViewController = EditRoutineViewController()
        editViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
    
    // MARK: - Action Methods
    
    @objc
    private func presentToBottomSheet() {
        showBottomSheet()
    }
    
    @objc
    private func pushToAddRoutine() {
        let addRoutineViewController = AddRoutineViewController()
        addRoutineViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addRoutineViewController, animated: true)
    }
}
