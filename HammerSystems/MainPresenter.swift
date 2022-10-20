//
//  MainPresenter.swift
//  HammerSystems
//
//  Created by Al Stark on 19.10.2022.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, service: serviceProtocol)
    func getFoods()
    var menu: [MenuElement]? {get set}
    var photos: [UIImage]? {get set}
}

class MainPresenter: MainViewPresenterProtocol {
    var photos: [UIImage]?
    weak var view: MainViewProtocol?
    let service: serviceProtocol
    var menu: [MenuElement]?
    
    required init(view: MainViewProtocol, service: serviceProtocol) {
        self.view = view
        self.service = service
        getFoods()
    }
    
    func getFoods() {
        service.getFood { [weak self] result  in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result{
                case .success(let menu):
                    self.menu = menu
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
