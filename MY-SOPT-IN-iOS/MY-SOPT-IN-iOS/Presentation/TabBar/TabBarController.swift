//
//  TabBarController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/16.
//

import UIKit

import SnapKit

final class TabBarController: UITabBarController {
    
    // MARK: - Properties

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setViewController()
    }
    
    // MARK: - Methods
    
    private func setStyle() {
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .Primary.primary
        self.tabBar.unselectedItemTintColor = .Gray.gray_800
    }
    
    private func setViewController() {
        
        let homeViewController = UIViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: ImageLiterals.TabBar.home, tag: 0)
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        
        let routineViewController = UIViewController()
        routineViewController.view.backgroundColor = .Gray.gray_50
        routineViewController.tabBarItem = UITabBarItem(title: "루틴추천", image: ImageLiterals.TabBar.like, tag: 1)
        let routineNavigationController = UINavigationController(rootViewController: routineViewController)
        
        let achieveViewController = UIViewController()
        achieveViewController.view.backgroundColor = .Gray.gray_100
        achieveViewController.tabBarItem = UITabBarItem(title: "성취", image: ImageLiterals.TabBar.achieve, tag: 2)
        let achieveNavigationController = UINavigationController(rootViewController: achieveViewController)
        
        let socialViewController = UIViewController()
        socialViewController.view.backgroundColor = .Gray.gray_200
        socialViewController.tabBarItem = UITabBarItem(title: "소셜", image: ImageLiterals.TabBar.social, tag: 3)
        let socialNavigationController = UINavigationController(rootViewController: socialViewController)
        
        let myProfileViewController = UIViewController()
        myProfileViewController.view.backgroundColor = .Gray.gray_400
        myProfileViewController.tabBarItem = UITabBarItem(title: "내정보", image: ImageLiterals.TabBar.myProfile, tag: 4)
        let myProfileNavigationController = UINavigationController(rootViewController: myProfileViewController)
        
        viewControllers = [homeNavigationController,
                           routineNavigationController,
                           achieveNavigationController,
                           socialNavigationController,
                           myProfileNavigationController]
    }
    
    // MARK: - @objc Function


}
