//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 28.04.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var slideTitleLbl: UILabel!

    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(slide:OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
    
}
