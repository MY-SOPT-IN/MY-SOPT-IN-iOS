//
//  AddRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

class AddRoutineViewController: UIViewController {
    
    
    private let addNavigationbar = Customnavigationbar("루틴 추가하기")
    private let testLabel = UILabel().then{
        $0.text = "실험"
    }
    //    private let addRoutine = RoutineView()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        title = "루틴 추가하기"
//        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.topItem?.title = ""

        navigationController?.isNavigationBarHidden = true
        setUI()
//        view.addSubviews(addNavigationbar, testLabel)
        
//        view.addSubview(addRoutine)
      
//        addRoutine.snp.makeConstraints {
//            $0.top.equalTo(addNavigationbar.snp.bottom)
//            $0.leading.bottom.trailing.equalToSuperview()
//        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setUI(){
        view.addSubview(addNavigationbar)
        view.addSubview(testLabel)
        addNavigationbar.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        testLabel.snp.makeConstraints{
            $0.top.equalTo(addNavigationbar.snp.bottom)
        }
    }
}
