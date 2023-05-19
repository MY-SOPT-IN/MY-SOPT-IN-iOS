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
    
    // MARK: - UI Components
    
    private let routineNameTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "루틴 이름", attributes: [NSAttributedString.Key.foregroundColor: UIColor.Gray.gray_400])
        $0.textColor = UIColor.Gray.gray_900
        $0.font = UIFont.bodyFont()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        $0.backgroundColor = .white
    }
    
    private let completeSection = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 56)).then{
        $0.backgroundColor = .white
    }
    
    private let completeImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20)).then{
        $0.image = ImageLiterals.Icon.add_ic_checkbox
    }
    private let secondSection = UIView().then{
        $0.backgroundColor = .white
    }
    
    private let alarmImage = UIImageView().then{
        $0.image = ImageLiterals.Icon.add_ic_bell
    }
    private let alarmLabel = UILabel().then{
        $0.text = "알람"
        $0.font = UIFont.subtitleFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    private let alarmSwitch = UISwitch()
    
    
    private let whenImage = UIImageView().then{
        $0.image = ImageLiterals.Icon.add_ic_checkbox
    }
    private let whenLabel = UILabel().then{
        $0.text = "언제 할래요?"
        $0.font = UIFont.subtitleFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    private let exampleLabel = UILabel().then{
        $0.text = "ex) 8:00/출근길/ALL"
        $0.font = UIFont.bodyFont()
        $0.textColor = UIColor.Gray.gray_500
    }
    private let whenButton = UIButton().then{
        $0.setImage(ImageLiterals.Icon.add_ic_vector, for: .normal)
    }

    private let routineImage = UIImageView().then{
        $0.image = ImageLiterals.Icon.add_ic_calender
    }
    private let routineLabel = UILabel().then{
        $0.text = "루틴 반복 주기"
        $0.font = UIFont.subtitleFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    private let routineSetLabel = UILabel().then{
        $0.text = "일, 월, 화, 수, 목, 금 ,토"
        $0.font = UIFont.bodyFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    private let routineButton = UIButton().then{
        $0.setImage(ImageLiterals.Icon.add_ic_vector, for: .normal)
    }

    private let horizontalWall1 = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_100
    }
    
    private let horizontalWall2 = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_100
    }
    
    private let headerLabel = UILabel().then{
        $0.text = "추가설정"
        $0.font = UIFont.subtitleFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    
    private let thirdSection = UIView().then{
        $0.backgroundColor = .white
    }
    
    private let nondisclosureLabel = UILabel().then{
        $0.text = "비공개"
        $0.font = UIFont.bodyFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    
    private let nondisclosureImage = UIImageView().then{
        $0.image = ImageLiterals.Icon.add_ic_question
    }
   
    private let nondisclosureSwitch = UISwitch()
    
    private let highlighterLabel = UILabel().then{
        $0.text = "형광펜"
        $0.font = UIFont.bodyFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    
    private let highlighterImage = UIImageView().then{
        $0.image = ImageLiterals.Icon.add_ic_question
    }
   
    private let highlighterSwitch = UISwitch()
    
    private let startdateLabel = UILabel().then{
        $0.text = "시작일"
        $0.font = UIFont.bodyFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    
    private let startdateButton = UIButton().then{
        $0.setTitle("2023. 5.19.", for: .normal)
        $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        $0.titleLabel?.font = UIFont.bodyFont()
        $0.backgroundColor = UIColor.Gray.gray_100
        $0.layer.cornerRadius = 7
    }
    
    private let timeFilterLabel = UILabel().then{
        $0.text = "시간 필터"
        $0.font = UIFont.bodyFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    
    private let timeFilterImage = UIImageView().then{
        $0.image = ImageLiterals.Icon.add_ic_question
    }
    
    private let sunButton = UIButton().then{
        $0.setImage(ImageLiterals.Icon.add_ic_sun, for: .normal)
        $0.tintColor = UIColor.Gray.gray_200
    }

    private let coffeeButton = UIButton().then{
        $0.setImage(ImageLiterals.Icon.add_ic_coffee, for: .normal)
        $0.tintColor = UIColor.Gray.gray_200
    }
    
    private let moonButton = UIButton().then{
        $0.setImage(ImageLiterals.Icon.add_ic_moon, for: .normal)
        $0.tintColor = UIColor.Gray.gray_200
    }
    
    private let themeLabel = UILabel().then{
        $0.text = "테마"
        $0.font = UIFont.bodyFont()
        $0.textColor = UIColor.Gray.gray_900
    }
    
    private let themenilLabel = UILabel().then{
        $0.text = "없음"
        $0.font = UIFont.bodyFont()
        $0.textColor = UIColor.Gray.gray_500
    }
    
    private let themeButton = UIButton().then{
        $0.setImage(ImageLiterals.Icon.add_ic_vector, for: .normal)
    }
    
    private let horizontalWall3 = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_100
    }
    
    private let horizontalWall4 = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_100
    }
    private let horizontalWall5 = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_100
    }
    
    private let horizontalWall6 = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_100
    }
    
    private let saveButton = UIButton().then(){
        $0.setTitle("시작하기", for: .normal)
        $0.titleLabel?.font = UIFont.subtitleFont()
        $0.setTitleColor(UIColor.Primary.primary_900, for: .normal)
        $0.backgroundColor = UIColor.Primary.primary
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.Gray.gray_50
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setUI
    
    private func setupViews() {

        addSubviews(
            routineNameTextField,
            completeSection,
            completeImage,
            secondSection,
            alarmImage,
            alarmLabel,
            alarmSwitch,
            horizontalWall1,
            whenImage,
            whenLabel,
            exampleLabel,
            whenButton,
            horizontalWall2,
            routineImage,
            routineLabel,
            routineSetLabel,
            routineButton,
            headerLabel,
            thirdSection,
            nondisclosureLabel,
            nondisclosureImage,
            nondisclosureSwitch,
            highlighterLabel,
            highlighterImage,
            highlighterSwitch,
            startdateLabel,
            startdateButton,
            timeFilterLabel,
            timeFilterImage,
            sunButton,
            coffeeButton,
            moonButton,
            themeLabel,
            themenilLabel,
            themeButton,
            horizontalWall3,
            horizontalWall4,
            horizontalWall5,
            horizontalWall6,
            saveButton
        )
    }
    
    private func setupLayout() {
        
        routineNameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalTo(completeSection.snp.leading).offset(-7)
            $0.width.equalTo(280)
            $0.height.equalTo(56)        }
        
        completeSection.snp.makeConstraints {
            $0.centerY.equalTo(routineNameTextField)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(56)
            $0.height.equalTo(56)
        }
        
        completeImage.snp.makeConstraints{
            $0.centerY.equalTo(completeSection)
            $0.top.leading.equalTo(completeSection).offset(18)

        }
        
        
        secondSection.snp.makeConstraints{
            $0.top.equalTo(routineNameTextField.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(166)
        }
        
        alarmImage.snp.makeConstraints{
            $0.top.equalTo(secondSection.snp.top).offset(19)
            $0.leading.equalTo(secondSection.snp.leading).offset(18)
        }
        
        alarmLabel.snp.makeConstraints{
            $0.top.equalTo(secondSection.snp.top).offset(20)
            $0.leading.equalTo(alarmImage.snp.trailing).offset(7)
        }
        
        alarmSwitch.snp.makeConstraints{
            $0.top.equalTo(secondSection.snp.top).offset(14)
            $0.trailing.equalTo(secondSection.snp.trailing).offset(-18)
        }
        
        horizontalWall1.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalTo(alarmImage.snp.bottom).offset(18)
            $0.trailing.leading.equalTo(secondSection).inset(17)
        }
        
        whenImage.snp.makeConstraints{
            $0.top.equalTo(horizontalWall1.snp.bottom).offset(17.5)
            $0.leading.equalTo(secondSection.snp.leading).offset(18)
        }
        
        whenLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall1.snp.bottom).offset(18.5)
            $0.leading.equalTo(whenImage.snp.trailing).offset(7)
        }
        
        exampleLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall1.snp.bottom).offset(19.5)
            $0.trailing.equalTo(secondSection).offset(-43)
        }
        
        whenButton.snp.makeConstraints{
            $0.top.equalTo(horizontalWall1.snp.bottom).offset(14.5)
            $0.trailing.equalTo(secondSection).offset(-24)
        }
        
        horizontalWall2.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalTo(whenImage.snp.bottom).offset(18)
            $0.trailing.leading.equalTo(secondSection).inset(17)
        }
        
        routineImage.snp.makeConstraints{
            $0.top.equalTo(horizontalWall2.snp.bottom).offset(17.5)
            $0.leading.equalTo(secondSection.snp.leading).offset(18)
        }
        
        routineLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall2.snp.bottom).offset(18.5)
            $0.leading.equalTo(routineImage.snp.trailing).offset(7)
        }
        
        routineSetLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall2.snp.bottom).offset(18.5)
            $0.trailing.equalTo(secondSection).offset(-42)
        }
        
        routineButton.snp.makeConstraints{
            $0.top.equalTo(horizontalWall2.snp.bottom).offset(14.5)
            $0.trailing.equalTo(secondSection).offset(-24)
        }
        
        headerLabel.snp.makeConstraints{
            $0.top.equalTo(secondSection.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        thirdSection.snp.makeConstraints{
            $0.top.equalTo(headerLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(280)
        }
        
        nondisclosureLabel.snp.makeConstraints{
            $0.top.equalTo(thirdSection.snp.top).offset(23)
            $0.leading.equalTo(thirdSection.snp.leading).offset(17)
        }
        
        nondisclosureImage.snp.makeConstraints{
            $0.top.equalTo(thirdSection.snp.top).offset(22)
            $0.leading.equalTo(nondisclosureLabel.snp.trailing).offset(8)
        }
        
        nondisclosureSwitch.snp.makeConstraints{
            $0.top.equalTo(thirdSection.snp.top).offset(15)
            $0.trailing.equalTo(secondSection.snp.trailing).offset(-17)
        }
        
        horizontalWall3.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalTo(nondisclosureLabel.snp.bottom).offset(19)
            $0.trailing.leading.equalTo(secondSection).inset(17)
        }
        
        highlighterLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall3.snp.bottom).offset(19.5)
            $0.leading.equalTo(thirdSection.snp.leading).offset(17)
        }
        
        highlighterImage.snp.makeConstraints{
            $0.top.equalTo(horizontalWall3.snp.bottom).offset(18.5)
            $0.leading.equalTo(highlighterLabel.snp.trailing).offset(8)
        }
        
        highlighterSwitch.snp.makeConstraints{
            $0.top.equalTo(horizontalWall3.snp.bottom).offset(12.5)
            $0.trailing.equalTo(secondSection.snp.trailing).offset(-17)
        }
        
        horizontalWall4.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalTo(highlighterLabel.snp.bottom).offset(19)
            $0.trailing.leading.equalTo(secondSection).inset(17)
        }
        
        startdateLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall4.snp.bottom).offset(18.5)
            $0.leading.equalTo(thirdSection.snp.leading).offset(17)
        }
        
        startdateButton.snp.makeConstraints{
            $0.top.equalTo(horizontalWall4.snp.bottom).offset(11.5)
            $0.trailing.equalTo(thirdSection.snp.trailing).offset(-20)
            $0.width.equalTo(92)
            $0.height.equalTo(32)
        }
        
        horizontalWall5.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.bottom.equalTo(startdateLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalTo(secondSection).inset(17)
        }
        
        timeFilterLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall5.snp.bottom).offset(19.5)
            $0.leading.equalTo(thirdSection.snp.leading).offset(12)
        }
        
        timeFilterImage.snp.makeConstraints{
            $0.top.equalTo(horizontalWall5.snp.bottom).offset(18.5)
            $0.leading.equalTo(timeFilterLabel.snp.trailing).offset(8)
        }
        
        sunButton.snp.makeConstraints{
            $0.top.equalTo(horizontalWall5.snp.bottom).offset(9.5)
            $0.trailing.equalTo(thirdSection.snp.trailing).offset(-121.65)
            $0.width.equalTo(42.35)
            $0.height.equalTo(36)
        }
        
        coffeeButton.snp.makeConstraints{
            $0.top.equalTo(horizontalWall5.snp.bottom).offset(9.5)
            $0.trailing.equalTo(thirdSection.snp.trailing).offset(-71.82)
            $0.width.equalTo(42.35)
            $0.height.equalTo(36)
        }
        
        moonButton.snp.makeConstraints{
            $0.top.equalTo(horizontalWall5.snp.bottom).offset(9.5)
            $0.trailing.equalTo(thirdSection.snp.trailing).offset(-22)
            $0.width.equalTo(42.35)
            $0.height.equalTo(36)
        }
        
        horizontalWall6.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.bottom.equalTo(timeFilterLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalTo(secondSection).inset(17)
        }
        
        themeLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall6.snp.bottom).offset(17.5)
            $0.leading.equalTo(thirdSection.snp.leading).offset(12)
        }
        
        themenilLabel.snp.makeConstraints{
            $0.top.equalTo(horizontalWall6.snp.bottom).offset(18.5)
            $0.trailing.equalTo(thirdSection.snp.trailing).offset(-58)
        }
        
        themeButton.snp.makeConstraints{
            $0.top.equalTo(horizontalWall6.snp.bottom).offset(17)
            $0.trailing.equalTo(thirdSection.snp.trailing).offset(-34)

        }
        
        saveButton.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(71)
        }
    }
}
