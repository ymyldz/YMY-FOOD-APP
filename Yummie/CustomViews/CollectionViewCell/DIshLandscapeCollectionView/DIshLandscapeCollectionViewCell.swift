//
//  DIshLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 2.05.2023.
//

import UIKit

class DIshLandscapeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DIshLandscapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish : Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.decription
        caloriesLbl.text = dish.formattedCalories
    }
    
}
