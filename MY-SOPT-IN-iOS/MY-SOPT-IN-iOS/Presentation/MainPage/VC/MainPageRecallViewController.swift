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
    
    private var descRoutine: String = ""
    private var descBest: String = ""
    private var descSelf: String = ""
    private var singleserver: Bool = false
    
    // MARK: - UI Components
    
    private let headerView = MainPageRecallHeaderView()
    
    private let recall = UITableView()
    
    private var dateDummy: [[MyDates]] = [MyDates.getPreviousDateDummy(),
                                          MyDates.dummy(),
                                          MyDates.getNextDateDummy()]
    
    private var headerViewStartPoint: CGFloat = 0
    
    private var selectedDay = MyDates.getToday()?.dateComponents
    
    
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
        let totalRecallVC = TotalRecallViewController()
        navigationController?.pushViewController(totalRecallVC, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Network
    
    private func getSingle(date: String){
        let dateRequest = date
        RetroAPI.shared.getSingleRetroData(dateRequest: dateRequest) { result in
            switch result {
            case .success(let data):
                self.singleserver = true
                print("🍀🍀🍀  성 공 이 다  🍀🍀🍀")
                print(data)
                if let responseDTO = data as? SingleRetroResponseDTO {
                    let singleRetroData = responseDTO.data
                    self.descRoutine = singleRetroData.descRoutine
                    self.descBest = singleRetroData.descBest
                    self.descSelf = singleRetroData.descSelf
                } else {
                    print("SingleRetroResponseDTO 타입으로 다운캐스팅할 수 없습니다.")
                }
                self.recall.reloadData()
            default:
                self.singleserver = false
                print("🍀🍀🍀  왜 안 와  🍀🍀🍀")
                print(result)
            }
        }

    }
    
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
            if let day = selectedDay {
                // DateComponents에서 연, 월, 일 값을 추출합니다.
                let year = day.year ?? 0 // 기본값 설정
                let month = day.month ?? 0 // 기본값 설정
                let dayOfMonth = day.day ?? 0 // 기본값 설정
                
                // 날짜를 문자열로 변환합니다.
                let formattedDate = "\(year)-\(String(format: "%02d", month))-\(String(format: "%02d", dayOfMonth))"
                
                // 변환된 값을 저장하거나 활용할 수 있습니다.
                print(formattedDate) // "2023-05-24"
                getSingle(date: formattedDate)
            } else {
                print("selectedDay 값이 nil입니다.")
            }
            
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
        dateDummy[0] = MyDates.getPreviousDateDummy(current: dateDummy[1])
        reloadDateData()
    }
    
    private func nextDates() {
        for i in [0, 1] {
            dateDummy[i] = dateDummy[i + 1]
        }
        dateDummy[2] = MyDates.getNextDateDummy(current: dateDummy[1])
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecallTableViewCell
        cell.selectionStyle = .none // Disable cell selection highlighting

        if singleserver {
            cell.recallView.recallTextView.text = descRoutine
            cell.recallView.recallTextView.textColor = .black
            cell.recallView.bestTextView.text = descBest
            cell.recallView.bestTextView.textColor = .black
            cell.recallView.wantsayTextView.text = descSelf
            cell.recallView.wantsayTextView.textColor = .black
            return cell
        } else {
            // 204 상태 코드인 경우 원래 테이블 셀이 나오도록 설정
            // 초기 값으로 설정하거나 다른 처리를 하세요.
            cell.recallView.recallTextView.text = "오늘 루틴 어땠어요?"
            cell.recallView.recallTextView.textColor = UIColor.Gray.gray_400
            cell.recallView.bestTextView.text = "오늘은 뭐가 가장 좋았어요?"
            cell.recallView.bestTextView.textColor = UIColor.Gray.gray_400
            cell.recallView.wantsayTextView.text = "나에게 하고 싶은 말을 적어봐요 :)"
            cell.recallView.wantsayTextView.textColor = UIColor.Gray.gray_400
            return cell
        }
        
        
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
