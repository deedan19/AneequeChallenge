//
//  ShoeCollectionViewCell.swift
//  AneequeTask
//
//  Created by Decagon on 22/07/2021.
//

import UIKit

class ShoeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let identifier = "ShoeCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        favBtn.layer.cornerRadius = 8
        addBtn.layer.cornerRadius = 8
        
        let font:UIFont? = UIFont(name: "Helvetica", size:16)
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:8)
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "$ 200", attributes: [.font:font!])
        attString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:0,length:1))
        priceLabel.attributedText = attString
    }
    
    static func nib () -> UINib {
        return UINib(nibName: "ShoeCollectionViewCell", bundle: nil)
    }

}
