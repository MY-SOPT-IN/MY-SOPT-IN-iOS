//
//  MainPageViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

class MainPageViewController: UIViewController {
    
    let tabcell = UIButton().then{
        $0.setTitle("일단 버튼이에용", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.addTarget(self, action: #selector(showBottomSheet), for: .touchUpInside)
    }
    
    let tabcell2 = UIButton().then{
        $0.setTitle("일단 버튼이에용22", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.addTarget(self, action: #selector(pushEditRoutineViewController), for: .touchUpInside)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tabcell)
        view.addSubview(tabcell2)

        tabcell.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
        tabcell2.snp.makeConstraints{
            $0.top.equalTo(tabcell).offset(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc
    private func showBottomSheet(){
        let bottomsheet = BottomSheetViewController()
        self.present(bottomsheet, animated: true, completion: nil)
    }
    
    @objc
    private func pushEditRoutineViewController() {
        let editRoutineViewController = EditRoutineViewController()
        navigationController?.pushViewController(editRoutineViewController, animated: true)
    }
    
}
