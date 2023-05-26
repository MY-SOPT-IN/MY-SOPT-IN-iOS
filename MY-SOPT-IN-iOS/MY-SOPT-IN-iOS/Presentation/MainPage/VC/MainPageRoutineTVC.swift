//
//  MainPageRoutineTVC.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

class MainPageRoutineTVC: UITableViewCell {

    // MARK: - Properties

    static let identifier = "MainPageRoutineCell"
    static let routineBorderWidth: CGFloat = UIScreen.main.bounds.size.width - 45 - 139
    static let routineBorderLeading: CGFloat = 125
    
    private let touchBottomSheetView = UIView()
    private let whenDoRoutineView = UIView()
    private let routineContentView = UIView()
    private let doRoutineButton = UIButton()
    
    private let indexLabel = UILabel()
    private let whenDoRoutineLabel = UILabel()
    private let routineContentLabel = UILabel()
    
    var routineTapGesture: UITapGestureRecognizer = UITapGestureRecognizer() {
        didSet {
            touchBottomSheetView.addGestureRecognizer(routineTapGesture)
        }
    }

    private var selectedRoutine: Bool = false {
        didSet {
            if selectedRoutine {
                doRoutineButton.setImage(ImageLiterals.Icon.add_ic_checkbox, for: .normal)
            } else {
                doRoutineButton.setImage(.none, for: .normal)
            }
        }
    }
    
    private enum FirstLastCell {
        case first
        case last
        
        var maskedCorner: CACornerMask {
            switch self{
            case .first:
                return [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            case .last:
                return [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            }
        }
    }
    
    // MARK: - View Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(index: Int, _ routine: Routine, isFirstCell: Bool = false, isLastCell: Bool = false, selected: Bool) {
        
        indexLabel.text = String(index)
        whenDoRoutineLabel.text = routine.whendo
        routineContentLabel.text = routine.content
        if isFirstCell {
            makeCellRound(firstLastCell: FirstLastCell.first)
        }
        if isLastCell {
            makeCellRound(firstLastCell: FirstLastCell.last)
        }
        selectedRoutine = selected
    }
    
    // MARK: - Methods

    private func setStyle() {
        
        contentView.backgroundColor = .Gray.gray_50
        selectionStyle = .none

        indexLabel.do {
            $0.font = .caption2Font()
            $0.textColor = .Mono.black
            $0.textAlignment = .center
        }
        
        whenDoRoutineView.do {
            $0.backgroundColor = .Mono.white
            $0.layer.borderColor = UIColor.Gray.gray_200.cgColor
            $0.layer.borderWidth = 1
        }
        
        routineContentView.do {
            $0.backgroundColor = .Mono.white
            $0.layer.borderColor = UIColor.Gray.gray_200.cgColor
            $0.layer.borderWidth = 1
        }
        
        doRoutineButton.do {
            $0.backgroundColor = .Mono.white
            $0.layer.borderColor = UIColor.Gray.gray_200.cgColor
            $0.layer.borderWidth = 1
            $0.addTarget(self, action: #selector(tappedDoRoutineBtn), for: .touchUpInside)
        }
        
        whenDoRoutineLabel.do {
            $0.font = .bodyFont()
            $0.textColor = .Mono.black
            $0.textAlignment = .center
        }
        
        routineContentLabel.do {
            $0.font = .bodyFont()
            $0.textColor = .Mono.black
        }
    }
    
    private func setHierarchy() {
        
        contentView.addSubviews(indexLabel,
                                touchBottomSheetView,
                                doRoutineButton)
        
        touchBottomSheetView.addSubviews(whenDoRoutineView, routineContentView)
        
        whenDoRoutineView.addSubview(whenDoRoutineLabel)
        routineContentView.addSubview(routineContentLabel)
    }
    
    private func setLayout() {
        
        indexLabel.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
        
        touchBottomSheetView.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.equalTo(indexLabel.snp.trailing).offset(5)
            $0.trailing.equalTo(doRoutineButton.snp.leading)
        }
        
        whenDoRoutineView.snp.makeConstraints {
            $0.width.equalTo(93)
            $0.leading.top.bottom.equalToSuperview()
        }
        
        routineContentView.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.equalTo(whenDoRoutineView.snp.trailing)
            $0.trailing.top.bottom.equalToSuperview()
        }
        
        doRoutineButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(46)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
        
        whenDoRoutineLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        routineContentLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func makeCellRound(firstLastCell: FirstLastCell) {
        
        [whenDoRoutineView, routineContentView, doRoutineButton].forEach {
            $0.layer.cornerRadius = 5
            $0.layer.maskedCorners = firstLastCell.maskedCorner
        }
    }
    
    // MARK: - Methods

    @objc func tappedDoRoutineBtn() {
        selectedRoutine.toggle()
    }
}
