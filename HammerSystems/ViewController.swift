//
//  ViewController.swift
//  HammerSystems
//
//  Created by Al Stark on 19.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter:  MainViewPresenterProtocol!
    var tableView = UITableView()
    var actionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var dataSourcePhoto = [UIImage(named: "SecondPhoto"), UIImage(named: "SecondPhoto"), UIImage(named: "SecondPhoto")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        setupTableView()
        setupActionCollectionView()
        
    }
    
    func setupActionCollectionView() {
        actionCollectionView.register(ActionCollectionViewCell.self, forCellWithReuseIdentifier: ActionCollectionViewCell.reuseIdentifier)
        view.addSubview(actionCollectionView)
        actionCollectionView.backgroundColor = .clear
        actionCollectionView.keyboardDismissMode = .onDrag
        actionCollectionView.delegate = self
        actionCollectionView.dataSource = self
        actionCollectionView.pinTop(to: self.view, 76)
        actionCollectionView.pinBottom(to: tableView.topAnchor, 80)
        actionCollectionView.pinLeft(to: self.view, 0)
        actionCollectionView.pinRight(to: self.view, 0)
        let layot = UICollectionViewFlowLayout()
        layot.scrollDirection = .horizontal
        self.actionCollectionView.collectionViewLayout = layot

    }
    
    func setupTableView() {
        tableView.register(FoodTableViewCell.self, forCellReuseIdentifier: FoodTableViewCell.reuseIdentifier)
        view.addSubview(tableView)
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource = self
        tableView.delegate = self
        tableView.pin(to: self.view, [.left: 0, .top: 268, .right:0, .bottom:0])
    }


}

extension ViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.menu?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = presenter.menu?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.reuseIdentifier, for: indexPath) as? FoodTableViewCell
        cell?.configure(food: food)
        return cell ?? UITableViewCell()
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourcePhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = actionCollectionView.dequeueReusableCell(withReuseIdentifier: ActionCollectionViewCell.reuseIdentifier, for: indexPath) as? ActionCollectionViewCell
        cell?.configure(photo: dataSourcePhoto[indexPath.row]!)
        return cell ?? UICollectionViewCell()
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 182)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -8
    }
}
