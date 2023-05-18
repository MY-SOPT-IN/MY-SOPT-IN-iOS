//
//  EditRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

class EditRoutineViewController: UIViewController {

    private let editRoutine = RoutineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "루틴 수정하기"
        navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""

  
                
        view.addSubview(editRoutine)
        editRoutine.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin) // 뷰의 safeAreaLayoutGuide의 topMargin에 맞춥니다.

            $0.leading.bottom.trailing.equalToSuperview()
            
        }
    }
}