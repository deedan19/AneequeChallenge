//
//  HeaderCollectionViewCell.swift
//  AneequeTask
//
//  Created by Decagon on 23/07/2021.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    
   
    
    static let identifier = "HeaderCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCellView.layer.cornerRadius = 10
        
        let font:UIFont? = UIFont(name: "Helvetica", size:20)
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "$ 200", attributes: [.font:font!])
        attString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:0,length:1))
        priceLabel.attributedText = attString
        
    }
    
    static func nib () -> UINib{
        return UINib(nibName: "HeaderCollectionViewCell", bundle: nil)
    }

}
