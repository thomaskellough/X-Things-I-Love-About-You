//
//  ViewController.swift
//  X-Things-I-Love-About-You
//
//  Created by Thomas Kellough on 1/24/21.
//

import UIKit
import SOTabBar

class ViewController: SOTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ComplimentViewController")
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ComplimentTableViewController")
        
        let firstTabImage = UIImage(systemName: "bolt.heart.fill")?.withTintColor(UIColor.App.Secondary, renderingMode: .alwaysOriginal)
        let firstTabImageSelected = UIImage(systemName: "bolt.heart.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        firstVC.tabBarItem = UITabBarItem(
            title: "<3",
            image: firstTabImage,
            selectedImage: firstTabImageSelected
        )
        
        let secondTabImage = UIImage(systemName: "heart.text.square.fill")?.withTintColor(UIColor.App.Secondary, renderingMode: .alwaysOriginal)
        let secondTabImageSelected = UIImage(systemName: "heart.text.square.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        secondVC.tabBarItem = UITabBarItem(
            title: "<3<3<3",
            image: secondTabImage,
            selectedImage: secondTabImageSelected
        )
        
        viewControllers = [firstVC, secondVC]
    }
    
    
    override func loadView() {
        super.loadView()
        
        SOTabBarSetting.tabBarTintColor = UIColor.App.Secondary
        SOTabBarSetting.tabBarBackground = UIColor.App.Primary
        SOTabBarSetting.tabBarSizeImage = 40.0
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 65, height: 65)
        SOTabBarSetting.tabBarHeight = 60
    }
}

