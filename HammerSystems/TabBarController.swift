//
//  TabBarController.swift
//  HammerSystems
//
//  Created by Al Stark on 20.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    func generateTabBar() {
        viewControllers = [
            generateVC(viewcontroller: ModelBuilder.creatMain(), title: "Меню", image: UIImage(named: "burger")),
            generateVC(viewcontroller: ContactsViewController(), title: "Контакты", image: UIImage(named: "contacts"))
        ]
    }
    
    func generateVC(viewcontroller: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewcontroller.tabBarItem.title = title
        viewcontroller.tabBarItem.image = image
        return viewcontroller
    }
    

   
}
