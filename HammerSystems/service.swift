//
//  service.swift
//  HammerSystems
//
//  Created by Al Stark on 20.10.2022.
//

import Foundation
import UIKit

protocol serviceProtocol {
    func getFood(completion: @escaping (Result<[MenuElement]?, Error>) -> Void)
//    func getPhotod(menu: [MenuElement]) -> [UIImage]
}

class Service: serviceProtocol {
//    func getPhotod(menu: [MenuElement]) -> [UIImage] {
//        var images = [UIImage]()
//        menu.forEach { food in
//            let urlString = food.imageURL
//            guard let url = URL(string: urlString) else {return}
//
//            DispatchQueue.global().async {
//                if let data = try? Data(contentsOf: url) {
//                    if let image = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            images.append(image)
//                        }
//                    }
//                }
//            }
//        }
//        return images
//    }
    
    
    
    func getFood(completion: @escaping (Result<[MenuElement]?, Error>) -> Void) {
        let urlString = "https://api.punkapi.com/v2/beers"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([MenuElement].self, from: data!)
                
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
