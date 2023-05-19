//
//  AddRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

class AddRoutineViewController: UIViewController {
    private let addRoutine = RoutineView()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "루틴 추가하기"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""

        view.addSubview(addRoutine)
        addRoutine.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}
