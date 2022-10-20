//
//  ModuleBuilder.swift
//  HammerSystems
//
//  Created by Al Stark on 19.10.2022.
//

import UIKit

protocol Builder {
    static func creatMain() -> UIViewController
}

class ModelBuilder: Builder {
    static func creatMain() -> UIViewController {
        let view = ViewController()
        let service = Service()
        let presenter = MainPresenter(view: view, service: service)
        view.presenter = presenter
        return view
    }
    
    
}
