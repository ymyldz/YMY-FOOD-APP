//
//  HomeViewController.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 29.04.2023.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    
    var categories : [DishCategory] = []
    var populars : [Dish] = []
    var specials : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        registerCell()
        
        ProgressHUD.show()
        
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let AllDishes):
                ProgressHUD.dismiss()
                self?.categories = AllDishes.categories ?? []
                self?.populars = AllDishes.populars ?? []
                self?.specials = AllDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
        
        
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
