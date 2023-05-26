//
//  TotalRecallViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class TotalRecallViewController: UIViewController {
    
    // MARK: - Properties
    
    private var totalRecallArray: [TotalRetroData] = []
    
    // MARK: - UI Components
    
    private let naviBar = UIView()
    
    private let backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(ImageLiterals.Icon.add_ic_arrow, for: .normal)
        btn.addTarget(self, action: #selector(popToTotalRoutineViewController), for: .touchUpInside)

        return btn
    }()
    
    private let naviTitle: UILabel = {
        let label = UILabel()
        label.text = "회고 모아보기"
        label.font = UIFont.title1Font()
        label.textColor = .Gray.gray_900
        return label
    }()
    
    private lazy var calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icon.add_ic_calendar, for: .normal)
        button.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
        getTotalRecallAPI(month: 5)
    }
    
    private func registerCells() {
        tableView.register(TotalRecallTableViewCell.self, forCellReuseIdentifier: TotalRecallTableViewCell.className)
        tableView.register(TotalRecallHeaderView.self, forHeaderFooterViewReuseIdentifier: TotalRecallHeaderView.className)
    }
    
    @objc private func showDatePicker() {
        UIView.animate(withDuration: 0.3) {
            let modal = DatePickerViewController()
            modal.modalPresentationStyle = .custom
            modal.transitioningDelegate = self
            self.present(modal, animated: true)
        }
    }
    
    @objc
    private func popToTotalRoutineViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension TotalRecallViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

// MARK: - PresentationController

class CustomPresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        let yOffset: CGFloat = 300
        let yOrigin = containerView.bounds.height - yOffset
        return CGRect(x: 0, y: yOrigin, width: containerView.bounds.width, height: yOffset)
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        
        // 배경 뷰 생성
        let backgroundView = UIView(frame: containerView.bounds)
        backgroundView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        backgroundView.alpha = 0
        containerView.insertSubview(backgroundView, at: 0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        backgroundView.addGestureRecognizer(tapGesture)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            backgroundView.alpha = 1
        }, completion: nil)
        
        presentedViewController.view.layer.cornerRadius = 12
        presentedViewController.view.clipsToBounds = true
    }
    
    @objc private func backgroundViewTapped() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }

}

// MARK: - UI & Layout

extension TotalRecallViewController {
    
    private func setBackgroundColor() {
        view.backgroundColor = UIColor.Gray.gray_100
    }
    
    private func setLayout() {
        view.addSubviews(naviBar, tableView)
        naviBar.addSubviews(backButton, naviTitle, calendarButton)
        
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
        
        calendarButton.snp.makeConstraints {
            $0.top.equalTo(backButton)
            $0.trailing.equalToSuperview().inset(24)
            $0.size.equalTo(18)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(naviBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UITableView Delegate & Datasource

extension TotalRecallViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return totalRecallArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TotalRecallTableViewCell.className, for: indexPath) as? TotalRecallTableViewCell else { return UITableViewCell() }
        if indexPath.row == 0 {
            cell.dataBind(style: .routineRecall, detail: totalRecallArray[indexPath.row].descRoutine)
        } else if indexPath.row == 1 {
            cell.dataBind(style: .bestThing, detail: totalRecallArray[indexPath.row].descBest)
        } else {
            cell.dataBind(style: .selfMessage, detail: totalRecallArray[indexPath.row].descSelf)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TotalRecallHeaderView.className) as? TotalRecallHeaderView else { return nil }
        
        // 수정 버튼을 눌렀을 때
        view.editButtonTappedClosure = {[weak self] in
            print("edit")
            // 루틴 수정 뷰로
            let editRecallViewController = EditRecallViewController()
            editRecallViewController.hidesBottomBarWhenPushed = true
            self?.navigationController?.pushViewController(editRecallViewController, animated: true)
            
        }
        
        view.dataBind(date: self.totalRecallArray[section].writtenDate)
        
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

// MARK: - Network

extension TotalRecallViewController {
    private func getTotalRecallAPI(month: Int) {
        RetroAPI.shared.getTotalRetroData(dateRequest: month) { response in
            switch response {
            case .success(let data):
                print("🍀🍀🍀  성 공 이 다  🍀🍀🍀")
                guard let responseDTO = data as? TotalRetroResponseDTO else { return }
                let dataArray = responseDTO.data
                for data in dataArray {
                    self.totalRecallArray.append(data)
                }
                self.tableView.reloadData()
            default:
                print("🍀🍀🍀  왜 안 와  🍀🍀🍀")
                print(response)
            }
        }
    }
}
