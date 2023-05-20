//
//  TotalRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class TotalRoutineViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let naviBar = UIView()
    
    private let backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(ImageLiterals.Icon.add_ic_arrow, for: .normal)
        return btn
    }()
    
    private let naviTitle: UILabel = {
        let label = UILabel()
        label.text = "회고 모아보기"
        label.font = UIFont.title1Font()
        label.textColor = .Gray.gray_900
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setLayout()
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(TotalRoutineTableViewCell.self, forCellReuseIdentifier: TotalRoutineTableViewCell.className)
        tableView.register(TotalRoutineHeaderView.self, forHeaderFooterViewReuseIdentifier: TotalRoutineHeaderView.className)
    }
}

// MARK: - UI & Layout

extension TotalRoutineViewController {
    
    private func setBackgroundColor() {
        view.backgroundColor = UIColor.Gray.gray_100
    }
    
    private func setLayout() {
        view.addSubviews(naviBar, tableView)
        naviBar.addSubviews(backButton, naviTitle)
        
        naviBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(54)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(17)
            $0.width.equalTo(10)
        }
        
        naviTitle.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(naviBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UITableView Delegate & Datasource

extension TotalRoutineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TotalRoutineTableViewCell.className, for: indexPath) as? TotalRoutineTableViewCell else { return UITableViewCell() }
        if indexPath.row == 0 {
            cell.dataBind(style: .routineRecall, detail: "회고회고")
        } else if indexPath.row == 1 {
            cell.dataBind(style: .bestThing, detail: "행복행복")
        } else {
            cell.dataBind(style: .selfMessage, detail: "나에게 한마디")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TotalRoutineHeaderView.className) as? TotalRoutineHeaderView else { return nil }
        view.editButtonTappedClosure = {[weak self] in
            print("edit")
            // 루틴 수정 뷰로
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
