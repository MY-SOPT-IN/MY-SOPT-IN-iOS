//
//  MainPageRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/18.
//

import UIKit

import SnapKit
import Then

class MainPageRoutineViewController: UIViewController {
    
    // MARK: - Properties
    
    private var headerView = MainPageRoutineHeaderView()
    private var routineView = UITableView()
    
    private let dummy = Routine.dummy()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    // MARK: - Methods
    
    func setStyle() {
        view.backgroundColor = .Gray.gray_50
        
        routineView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(MainPageRoutineTVC.self,
                        forCellReuseIdentifier: MainPageRoutineTVC.identifier)
            $0.rowHeight = 50
            $0.separatorStyle = .none
            $0.backgroundColor = .Gray.gray_50
            $0.tableHeaderView = headerView
            $0.tableHeaderView?.frame.size.height = 130
        }
    }


func setLayout() {
    view.addSubviews(routineView)
    
    // FIXME: - bottomInset 수정 필요
    
    routineView.snp.makeConstraints {
        $0.bottom.equalToSuperview().inset(89)
        $0.top.leading.trailing.equalToSuperview()
    }
}

// MARK: - @objc Function

// MARK: - Network

}

extension MainPageRoutineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainPageRoutineTVC.identifier, for: indexPath) as? MainPageRoutineTVC else { return UITableViewCell() }
        if indexPath.row == 0 && indexPath.row == dummy.count - 1 {
            cell.configCell(index: indexPath.row, dummy[indexPath.row], isFirstCell: true, isLastCell: true)
        } else if indexPath.row == 0 {
            cell.configCell(index: indexPath.row, dummy[indexPath.row], isFirstCell: true)
        } else if indexPath.row == dummy.count - 1 {
            cell.configCell(index: indexPath.row, dummy[indexPath.row], isLastCell: true)
        } else {
            cell.configCell(index: indexPath.row, dummy[indexPath.row])
        }
        return cell
    }
}
extension MainPageRoutineViewController: UITableViewDelegate { }

