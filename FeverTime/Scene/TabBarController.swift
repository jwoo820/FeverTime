//
//  TabBarController.swift
//  FeverTime
//
//  Created by Park Jungwoo on 2022/07/05.
//

import UIKit

class TabBarController: UITabBarController {
    private lazy var homeViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: HomeViewController())
        let tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            tag: 0
        )
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var exerciseViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: ExerciseViewController())
        let tabBarItem = UITabBarItem(
            title: "운동",
            image: UIImage(named: "dumbbell"),
            tag: 1
        )
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var dietViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: DietViewController())
        let tabBarItem = UITabBarItem(
            title: "식단",
            image: UIImage(named: "chef"),
            tag: 2
        )
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var settingViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: SettingViewController())
        let tabBarItem = UITabBarItem(
            title: "설정",
            image: UIImage(systemName: "gearshape"),
            tag: 3
        )
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            homeViewController,
            exerciseViewController,
            dietViewController,
            settingViewController
        ]
    }
}

