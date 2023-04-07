//
//  MainTBC.swift
//  GitClone
//
//  Created by user1 on 12/05/22.
//

import UIKit

class MainTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabbarSetup()
    }
    

   
    func tabbarSetup() {
        let vc1 = MainVC()
        let navVc1 = UINavigationController(rootViewController: vc1)
        
        let vc2 = ProfileVC()
        let navVc2 = UINavigationController(rootViewController: vc2)
        
        let tabbarItem1 = UITabBarItem(title: "Main", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        
        let tabbarItem2 = UITabBarItem(title: "Proifle", image: UIImage(systemName: "person.fill"), selectedImage: nil)
        vc1.tabBarItem = tabbarItem1
        vc2.tabBarItem = tabbarItem2
            
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.1694300473, green: 0.5687942505, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.517593801, green: 0.5176843405, blue: 0.5175818801, alpha: 1)

        
        viewControllers = [navVc1,navVc2]
        }

}
