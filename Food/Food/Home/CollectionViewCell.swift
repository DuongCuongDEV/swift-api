//
//  CollectionViewCell.swift
//  Food
//
//  Created by Dương Văn Cường on 10/05/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
