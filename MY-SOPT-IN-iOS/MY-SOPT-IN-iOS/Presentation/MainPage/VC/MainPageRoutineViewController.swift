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
    private var bezierView: MainPageRoutineBorderView?
    
    private let dateDummy = Dates.dummy()
    private let routineDummy = Routine.dummy()
    
    private let routineTableViewHeaderHeight: CGFloat = 130
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        setStyle()
        setLayout()
    }
    
    
    // MARK: - Methods
    
    func target() {
        headerView.selectDateView.delegate = self
        headerView.selectDateView.dataSource = self
        headerView.selectDateView.isPagingEnabled = true
        headerView.selectDateView.register(SelectDateCVC.self, forCellWithReuseIdentifier: SelectDateCVC.identifier)
        headerView.selectDateView.register(SelectDateHeaderFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SelectDateHeaderFooter.identifier)
        headerView.selectDateView.register(SelectDateHeaderFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SelectDateHeaderFooter.identifier)
    }
    
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
            $0.tableHeaderView?.frame.size.height = routineTableViewHeaderHeight
        }
        
        setBazierView()
    }
    
    
    func setLayout() {
        view.addSubviews(routineView)
        
        // FIXME: - bottomInset 수정 필요
        
        routineView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(89)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        guard let border = bezierView else { return }
        routineView.addSubview(border)
    }
    
    func setBazierView() {
        bezierView = MainPageRoutineBorderView(frame: CGRect(x: MainPageRoutineTVC.routineBorderLeading, y: routineTableViewHeaderHeight, width: MainPageRoutineTVC.routineBorderWidth, height: routineView.rowHeight * CGFloat(routineDummy.count)))
        bezierView?.backgroundColor = .clear
        bezierView?.makeRounded(radius: 5)
    }
    
    // MARK: - @objc Function
    
    // MARK: - Network
    
}

extension MainPageRoutineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routineDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainPageRoutineTVC.identifier, for: indexPath) as? MainPageRoutineTVC else { return UITableViewCell() }
        if indexPath.row == 0 && indexPath.row == routineDummy.count - 1 {
            cell.configCell(index: indexPath.row, routineDummy[indexPath.row], isFirstCell: true, isLastCell: true)
        } else if indexPath.row == 0 {
            cell.configCell(index: indexPath.row, routineDummy[indexPath.row], isFirstCell: true)
        } else if indexPath.row == routineDummy.count - 1 {
            cell.configCell(index: indexPath.row, routineDummy[indexPath.row], isLastCell: true)
        } else {
            cell.configCell(index: indexPath.row, routineDummy[indexPath.row])
        }
        return cell
    }
}

extension MainPageRoutineViewController: UITableViewDelegate { }

extension MainPageRoutineViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dateDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectDateCVC.identifier, for: indexPath) as? SelectDateCVC else { return UICollectionViewCell() }
        cell.configCell(date: dateDummy[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SelectDateHeaderFooter.identifier, for: indexPath) as? SelectDateHeaderFooter else {
                return SelectDateHeaderFooter()
            }
            return header
        } else {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SelectDateHeaderFooter.identifier, for: indexPath) as? SelectDateHeaderFooter else {
                return SelectDateHeaderFooter()
            }
            return footer
        }
    }
}

extension MainPageRoutineViewController: UICollectionViewDelegate { }
