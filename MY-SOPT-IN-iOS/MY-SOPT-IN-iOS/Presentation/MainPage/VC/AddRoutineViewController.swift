//
//  AddRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

import SnapKit
import Then

final class AddRoutineViewController: UIViewController {
    
    
    private let addNavigationbar = Customnavigationbar("루틴 추가하기").then {
        $0.navigationBack.addTarget(self,
                                    action: #selector(popToAddRoutineViewController),
                                    for: .touchUpInside
        )
    }
    
    private let addRoutine = RoutineView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        navigationController?.isNavigationBarHidden = true
    }

    // MARK: - setUI
    
    func setUI(){
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true

        view.addSubviews(
            addNavigationbar,
            addRoutine
        )
        
        addNavigationbar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        addRoutine.snp.makeConstraints {
            $0.top.equalTo(addNavigationbar.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Actions

    @objc
    private func popToAddRoutineViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
