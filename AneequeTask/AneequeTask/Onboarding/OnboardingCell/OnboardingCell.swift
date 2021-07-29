//
//  OnboardingCell.swift
//  AneequeTask
//
//  Created by Decagon on 25/07/2021.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup (with model: OnboardingModel)  {
        imageView.image = model.image
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        
    }
    
}
