//
//  EditRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

class EditRoutineViewController: UIViewController {
    
    
    private let editNavigationbar = Customnavigationbar("루틴 수정하기").then{
        $0.navigationBack.addTarget(self, action: #selector(popToEditRoutineViewController), for: .touchUpInside)
    }
    
    private let editRoutine = RoutineView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func setUI(){
        view.backgroundColor = .white
        view.addSubviews(
            editNavigationbar,
            editRoutine
        )
        editNavigationbar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        editRoutine.snp.makeConstraints{
            $0.top.equalTo(editNavigationbar.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    @objc
    private func popToEditRoutineViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
