//
//  ListMovieCollectionViewCell.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 10/05/2023.
//

import UIKit

class ListMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.layer.cornerRadius = 8
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
