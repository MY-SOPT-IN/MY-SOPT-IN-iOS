//
//  MainPageViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

class MainPageViewController: UIViewController {

    // MARK: - Properties
    
    private let topBar = MainPageTopBarView()
    private let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    lazy var routineViewController = MainPageRoutineViewController()
    lazy var recallViewController = MainPageRecallViewController()
    
    lazy var viewControllers = [routineViewController, recallViewController]

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    // MARK: - Network

}

extension MainPageViewController: UIPageViewControllerDelegate {}
extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController ) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 { return nil }
        return viewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController ) else { return nil }
        let nextIndex = index + 1
        if nextIndex > viewControllers.count - 1 { return nil }
        return viewControllers[nextIndex]
    }

}
