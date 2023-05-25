//
//  MainPageRecallViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/18.
//

import UIKit

import SnapKit
import Then

final class MainPageRecallViewController: UIViewController {
    
    // MARK: - Properties
    
    private let headerView = MainPageRecallHeaderView()
    
    private let recall = UITableView()
    
    private var dateDummy: [[Dates]] = [Dates.getPreviousDateDummy(),
                                        Dates.dummy(),
                                        Dates.getNextDateDummy()]
    
    private var headerViewStartPoint: CGFloat = 0
    
    private var selectedDay = Dates.getToday()?.dateComponents
    
    
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
        
        headerView.achieveRecallBtn.addTarget(self, action: #selector(moreButtonDidTapped), for: .touchUpInside)
        
        
        recall.dataSource = self
        recall.delegate = self
        recall.register(RecallTableViewCell.self, forCellReuseIdentifier: "Cell")
        recall.register(RecallFooterView.self, forHeaderFooterViewReuseIdentifier: "Footer")
        recall.separatorColor = .clear
        recall.tableHeaderView = headerView
        recall.tableHeaderView?.frame.size.height = 120
        recall.backgroundColor = .Gray.gray_50
        recall.showsVerticalScrollIndicator = false
    }
    
    private func setStyle() {
        
        view.backgroundColor = .Gray.gray_50
    }
    
    private func setHierarchy() {
        
        view.addSubviews(
            recall
        )
    }
    
    private func setLayout() {
        recall.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
    
    // MARK: - @objc Function
    
    @objc private func saveButtonTapped() {
        // 저장하기 버튼 클릭에 따른 메소드 미구현
    }
    
    @objc
    private func moreButtonDidTapped() {
        let totalRoutineVC = TotalRoutineViewController()
        navigationController?.pushViewController(totalRoutineVC, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Network
    
}

extension MainPageRecallViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let index = headerView.dateCollectionViews.firstIndex(of: collectionView as! SelectDateCollectionView) {
            selectedDay = dateDummy[index][indexPath.item].dateComponents
            collectionView.reloadData()
            headerView.dateLabel.text = dateDummy[index][indexPath.item].getDateString()
        }
    }
}

extension MainPageRecallViewController: UICollectionViewDataSource {
    
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

extension MainPageRecallViewController: UIScrollViewDelegate {
    
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

extension MainPageRecallViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none // Disable cell selection highlighting
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Footer") as? RecallFooterView
        footerView?.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
}
