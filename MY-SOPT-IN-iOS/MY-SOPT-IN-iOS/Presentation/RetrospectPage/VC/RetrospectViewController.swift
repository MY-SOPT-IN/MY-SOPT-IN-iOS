//
//  RetrospectViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class RetrospectViewController: UIViewController {

    private let retrospect = RetrospectView("루틴 회고", "오늘 루틴 어땠어요")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "회고 수정"
        navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""

    }
    


}
