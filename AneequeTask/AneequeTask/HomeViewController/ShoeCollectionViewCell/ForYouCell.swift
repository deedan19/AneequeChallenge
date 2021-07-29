//
//  ForYouCell.swift
//  AneequeTask
//
//  Created by Decagon on 25/07/2021.
//

import UIKit

class ForYouCell: UICollectionViewCell {
    
    var delegate: SeeAllViewControllerDelegate?
    
    @IBOutlet weak var seeAllBtn: UIButton!
    static let identifier = "ForYouCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib () -> UINib{
        return UINib(nibName: "ForYouCell", bundle: nil)
    }
    @IBAction func seeAllButton(_ sender: UIButton) {
        print("Okay, you tapped me!!")
        delegate?.instantiateSeeAllViewController()
    }
    
}
