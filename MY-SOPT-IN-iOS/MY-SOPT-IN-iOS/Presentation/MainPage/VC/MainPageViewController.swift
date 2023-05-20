//
//  MainPageViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

// class MainPageViewController: UIViewController, BottomSheetDelegate {
    
//     // MARK: - Properties
    
//     let tabcell = UIButton().then {
//         $0.setTitle("일단 바텀시트 올라오는 버튼", for: .normal)
//         $0.setTitleColor(UIColor.Gray.gray_900, for: .normal)
//         $0.addTarget(self, action: #selector(presentToBottomSheet), for: .touchUpInside)
//     }
    
//     let addButton = UIButton().then {
//         $0.setImage(ImageLiterals.Icon.add_ic_addButton, for: .normal)
//         $0.addTarget(self, action: #selector(pushToAddRoutine), for: .touchUpInside)
//     }

//     // MARK: - View Life Cycle
    
//     override func viewDidLoad() {
//         super.viewDidLoad()
//         view.backgroundColor = .white
//         view.addSubviews(
//             tabcell,
//             addButton
//         )

class MainPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let topBar = MainPageTopBarView()
    private let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    lazy var routineViewController = MainPageRoutineViewController()
    lazy var recallViewController = MainPageRecallViewController()
    
    lazy var viewControllers = [routineViewController, recallViewController]
    
    // MARK: - Target
    
    private func target() {
        topBar.routineLabel.do {
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchRoutineSegment)))
        }
        topBar.recallLabel.do {
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchRecallSegment)))
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        setStyle()
        setLayout()
    }
    
    // MARK: - Methods
    
    private func setStyle() {
        view.backgroundColor = .Mono.white
        topBar.backgroundColor = .Gray.gray_50
        
        setPageController()
    }
    
    private func setLayout() {
        view.addSubviews(topBar, pageController.view)
        addChild(pageController)
        pageController.didMove(toParent: self)
        
        topBar.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        pageController.view.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(topBar.snp.bottom)
        }
    }
    
    private func setPageController() {
        pageController.do {
            $0.delegate = self
            $0.dataSource = self
        }
        
        if let firstVC = viewControllers.first {
            pageController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - @objc Function
    
    @objc func touchRoutineSegment(sender: UITapGestureRecognizer) {
        pageController.setViewControllers([routineViewController], direction: .reverse, animated: true, completion: nil)
        topBar.updateIndicator(index: 0)
    }
    
    @objc func touchRecallSegment(sender: UITapGestureRecognizer) {
        pageController.setViewControllers([recallViewController], direction: .forward, animated: true, completion: nil)
        topBar.updateIndicator(index: 1)
    }
    
    // MARK: - Network
    
    //         tabcell.snp.makeConstraints {
    //             $0.centerX.centerY.equalToSuperview()
    //         }
    //         addButton.snp.makeConstraints {
    //             $0.top.equalTo(tabcell.snp.bottom).offset(30)
    //             $0.centerX.equalTo(tabcell)
    //         }
    //     }
    
    //     // MARK: - BottomSheetDelegate
    
    //     func showBottomSheet() {
    //         let bottomSheet = BottomSheetViewController()
    //         bottomSheet.delegate = self
    //         present(bottomSheet, animated: true, completion: nil)
    //     }
    
    //     func didTapButtonInBottomSheet() {
    //         let editViewController = EditRoutineViewController()
    //         editViewController.hidesBottomBarWhenPushed = true
    //         self.navigationController?.pushViewController(editViewController, animated: true)
    //     }
    
    //     // MARK: - Action Methods
    
    //     @objc
    //     private func presentToBottomSheet() {
    //         showBottomSheet()
    //     }
    
    //     @objc
    //     private func pushToAddRoutine() {
    //         let addRoutineViewController = AddRoutineViewController()
    //         addRoutineViewController.hidesBottomBarWhenPushed = true
    //         navigationController?.pushViewController(addRoutineViewController, animated: true)
    //     }
    // }
}
extension MainPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if previousViewControllers is [MainPageRecallViewController] {
                topBar.updateIndicator(index: 0)
            } else if previousViewControllers is [MainPageRoutineViewController] {
                topBar.updateIndicator(index: 1)
            }
        }
    }
}
extension MainPageViewController: UIPageViewControllerDataSource {
    
    // FIXME: - index가 2개이므로 더 간결하게 줄일 수 있지 않을까..?
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is MainPageRecallViewController {
            return viewControllers[0]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is MainPageRoutineViewController {
            return viewControllers[1]
        }
        return nil
    }
}

