//
//  RoutineView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/18.
//

import UIKit

import SnapKit
import Then

class RoutineView: UIView {
    
    private let routineNameTextField = UITextField().then {
        $0.placeholder = "루틴 이름"
        $0.textColor = UIColor.Gray.gray_500
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        $0.backgroundColor = .white
        // 텍스트 필드의 스타일을 설정합니다.
    }
    
    private let addButton = UIImageView(frame: CGRect(x: 0, y: 0, width: 56, height: 56)).then{
        $0.backgroundColor = .white
    }
    
    private let alarmImage = UIImage()
    private let alarmLabel = UILabel()
    private let alarmSwitch = UISwitch()
    private let alarmStack = UIStackView().then{
        $0.axis = .horizontal
    }
    
    private let whenImage = UIImage()
    private let whenLabel = UILabel()
    private let exampleLabel = UILabel()
    private let whenStack = UIStackView().then{
        $0.axis = .horizontal
    }
    
    private let routineImage = UIImage()
    private let routineLabel = UILabel()
    private let routineSetLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.Gray.gray_50
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(routineNameTextField)
        addSubview(addButton)
    }
    
    private func setupLayout() {
        
        routineNameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalTo(addButton.snp.leading).offset(-7)
            $0.width.equalTo(280)
            $0.height.equalTo(56)        }
        
        addButton.snp.makeConstraints {
            $0.centerY.equalTo(routineNameTextField)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(56)
            $0.height.equalTo(56)
        }
        
    }
}
