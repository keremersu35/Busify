//
//  OnboardingCell.swift
//  Busify
//
//  Created by Kerem Ersu on 1.04.2023.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    func setup(model: OnboardingModel) {
        image.image = model.image
        title.text = model.title
        detail.text = model.detail
    }
}
