//
//  MainPageViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class MainPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let topBar = MainPageTopBarView()
    private let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private lazy var routineViewController = MainPageRoutineViewController()
    private lazy var recallViewController = MainPageRecallViewController()
    
    private lazy var viewControllers = [routineViewController, recallViewController]
    
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
        setHierarchy()
        setLayout()
    }
    
    // MARK: - Methods
    
    private func setStyle() {
        
        view.backgroundColor = .Mono.white
        topBar.backgroundColor = .Gray.gray_50
        
        setPageController()
    }
    
    private func setHierarchy() {
        
        view.addSubviews(topBar, pageController.view)
        addChild(pageController)
        pageController.didMove(toParent: self)
    }
    
    private func setLayout() {
        
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
    
    @objc private func touchRoutineSegment(sender: UITapGestureRecognizer) {
        pageController.setViewControllers([routineViewController], direction: .reverse, animated: true, completion: nil)
        topBar.updateTopBar(index: 0)
    }
    
    @objc private func touchRecallSegment(sender: UITapGestureRecognizer) {
        pageController.setViewControllers([recallViewController], direction: .forward, animated: true, completion: nil)
        topBar.updateTopBar(index: 1)
    }
}

extension MainPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            if previousViewControllers is [MainPageRecallViewController] {
                topBar.updateTopBar(index: 0)
            } else if previousViewControllers is [MainPageRoutineViewController] {
                topBar.updateTopBar(index: 1)
            }
        }
    }
}

extension MainPageViewController: UIPageViewControllerDataSource {
        
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

