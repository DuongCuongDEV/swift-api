//
//  NewCollectionViewCell.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 09/05/2023.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblPriceNew: UILabel!
    @IBOutlet weak var lblNameNew: UILabel!
    @IBOutlet weak var imgNew: UIImageView! {
        didSet {
            imgNew.layer.cornerRadius = 10
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
