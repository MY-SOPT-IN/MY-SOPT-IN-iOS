//
//  MainPageRoutineViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/18.
//

import UIKit

import SnapKit
import Then

final class MainPageRoutineViewController: UIViewController {
    
    // MARK: - Properties
    
    private var headerView = MainPageRoutineHeaderView()
    private var routineView = UITableView()
    private var bezierView: MainPageRoutineBorderView?
    
    private var dateDummy: [[Dates]] = [Dates.getPreviousDateDummy(),
                                        Dates.dummy(),
                                        Dates.getNextDateDummy()]
    private let routineDummy = Routine.dummy()
    
    private let routineTableViewHeaderHeight: CGFloat = 140
    private var headerViewStartPoint: CGFloat = 0
    
    private var selectedDay = Dates.getToday()?.dateComponents
    
    private lazy var addButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    // MARK: - Methods
    
    private func target() {
        
        headerView.dateScrollView.delegate = self
        headerView.dateScrollView.contentOffset.x = UIScreen.main.bounds.width
        
        [headerView.previousSelectDateCollectionView, headerView.currentSelectDateCollectionView, headerView.nextSelectDateCollectionView].forEach {
            $0.dataSource = self
            $0.delegate = self
            $0.register(SelectDateCVC.self, forCellWithReuseIdentifier: SelectDateCVC.identifier)
            $0.register(SelectDateHeaderFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SelectDateHeaderFooter.identifier)
            $0.register(SelectDateHeaderFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SelectDateHeaderFooter.identifier)
        }
    }
    
    private func setStyle() {
        
        view.backgroundColor = .Gray.gray_50
        
        routineView.do {
            $0.dataSource = self
            $0.register(MainPageRoutineTVC.self,
                        forCellReuseIdentifier: MainPageRoutineTVC.identifier)
            $0.rowHeight = 50
            $0.separatorStyle = .none
            $0.backgroundColor = .Gray.gray_50
            $0.tableHeaderView = headerView
            $0.tableHeaderView?.frame.size.height = routineTableViewHeaderHeight
            $0.tableFooterView = UIView()
            $0.tableFooterView?.frame.size.height = 20
        }
        
        addButton.do {
            $0.setImage(ImageLiterals.Icon.add_ic_addButton, for: .normal)
            $0.addTarget(self, action: #selector(pushToAddRoutine), for: .touchUpInside)
        }
        
        setBazierView()
    }
    
    private func setHierarchy() {
        
        view.addSubviews(routineView,
                         addButton)
        
        guard let border = bezierView else { return }
        routineView.addSubview(border)
    }
    
    private func setLayout() {
                
        routineView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(80)
        }
    }
    
    private func setBazierView() {
        
        bezierView = MainPageRoutineBorderView(frame: CGRect(x: MainPageRoutineTVC.routineBorderLeading, y: routineTableViewHeaderHeight, width: MainPageRoutineTVC.routineBorderWidth, height: routineView.rowHeight * CGFloat(routineDummy.count)))
        bezierView?.backgroundColor = .clear
        bezierView?.makeRounded(radius: 5)
    }
    
    // MARK: - objc Func
    
    @objc
    private func pushToAddRoutine() {
        let addRoutineViewController = AddRoutineViewController()
        addRoutineViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addRoutineViewController, animated: true)
    }
}

extension MainPageRoutineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routineDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainPageRoutineTVC.identifier, for: indexPath) as? MainPageRoutineTVC else { return UITableViewCell() }
        cell.configCell(index: indexPath.row, routineDummy[indexPath.row], isFirstCell: indexPath.row == 0, isLastCell: indexPath.row == routineDummy.count - 1)
        return cell
    }
}

extension MainPageRoutineViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let index = headerView.dateCollectionViews.firstIndex(of: collectionView as! SelectDateCollectionView) {
            selectedDay = dateDummy[index][indexPath.item].dateComponents
            collectionView.reloadData()
            headerView.dateLabel.text = dateDummy[index][indexPath.item].getDateString()
        }
    }
}

extension MainPageRoutineViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let index = headerView.dateCollectionViews.firstIndex(of: collectionView as! SelectDateCollectionView) {
            return dateDummy[index].count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectDateCVC.identifier, for: indexPath) as? SelectDateCVC else { return UICollectionViewCell() }
        if let index = headerView.dateCollectionViews.firstIndex(of: collectionView as! SelectDateCollectionView) {
            if selectedDay == dateDummy[index][indexPath.item].dateComponents {
                cell.configCell(date: dateDummy[index][indexPath.item], selected: true)
            } else {
                cell.configCell(date: dateDummy[index][indexPath.item], selected: false)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SelectDateHeaderFooter.identifier, for: indexPath) as? SelectDateHeaderFooter else { return SelectDateHeaderFooter() }
            return header
        } else {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SelectDateHeaderFooter.identifier, for: indexPath) as? SelectDateHeaderFooter else { return SelectDateHeaderFooter() }
            return footer
        }
    }
}

extension MainPageRoutineViewController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        headerViewStartPoint = targetContentOffset.pointee.x
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        switch headerViewStartPoint {
        case 0:
            previousDates()
        case UIScreen.main.bounds.width:
            break
        case UIScreen.main.bounds.width * 2:
            nextDates()
        default:
            break
        }
    }
    
    private func previousDates() {
        for i in [2, 1] {
            dateDummy[i] = dateDummy[i - 1]
        }
        dateDummy[0] = Dates.getPreviousDateDummy(current: dateDummy[1])
        reloadDateData()
    }
    
    private func nextDates() {
        for i in [0, 1] {
            dateDummy[i] = dateDummy[i + 1]
        }
        dateDummy[2] = Dates.getNextDateDummy(current: dateDummy[1])
        reloadDateData()
    }
    
    private func reloadDateData() {
        headerView.previousSelectDateCollectionView.reloadData()
        headerView.currentSelectDateCollectionView.reloadData()
        headerView.nextSelectDateCollectionView.reloadData()
        
        headerView.dateScrollView.contentOffset.x = UIScreen.main.bounds.width
    }
}


