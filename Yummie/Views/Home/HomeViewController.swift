//
//  HomeViewController.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 29.04.2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    
    var categories : [DishCategory] = [
        .init(id: "id1", name: "African Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish5", image: "https://picsum.photos/100/200")]
    
    var populars : [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 24),
        .init(id: "id1", name: "Indomie", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 324),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 1024),
        
    ]
    
    var specials : [Dish] = [
        .init(id: "id1", name: "Mantı", image: "https://picsum.photos/100/200", decription: "This is my favourite", calories: 324),
        .init(id: "id1", name: "Kokoreç", image: "https://picsum.photos/100/200", decription: "This is the best I have ever tasted", calories: 1024)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        title = "Yummie"
        
//        let services = NetworkService()
//        let request =  services.createRequest(route: .temp, method: .get, paramaters: ["firstName": "Yusuf Mert", "lastName":"Yıldız"])
//        print("The URL is: \(request?.url)")
        
        registerCell()

    }
    
    private func registerCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        specialCollectionView.register(UINib(nibName: DIshLandscapeCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: DIshLandscapeCollectionViewCell.identifier)
        
        
    }
    
}

//MARK: 
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialCollectionView:
            return specials.count
        default : return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath ) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath ) as! DishPortraitCollectionViewCell
            
            cell.setup(dish: populars[indexPath.row])
            return cell
            
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DIshLandscapeCollectionViewCell.identifier, for: indexPath ) as! DIshLandscapeCollectionViewCell
            
            cell.setup(dish: specials[indexPath.row])
            return cell
        default : return UICollectionViewCell()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
