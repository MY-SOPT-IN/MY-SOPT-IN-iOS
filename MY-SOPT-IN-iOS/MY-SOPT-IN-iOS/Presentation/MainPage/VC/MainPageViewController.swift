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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tabcell)
        tabcell.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }

    @objc
    private func showBottomSheet(){
        let bottomsheet = BottomSheetViewController()
        self.present(bottomsheet, animated: true, completion: nil)
    }

}

