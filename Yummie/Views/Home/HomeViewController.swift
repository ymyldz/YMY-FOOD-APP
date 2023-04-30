//
//  HomeViewController.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 29.04.2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories : [DishCategory] = [
        .init(id: "id1", name: "African Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish5", image: "https://picsum.photos/100/200")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        title = "Yummie"
        
        registerCell()

    }
    
    private func registerCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
}
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath ) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
}
