//
//  PopularCollectionViewCell.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 09/05/2023.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblMoviePrice: UILabel! {
        didSet {
            lblMoviePrice.layer.cornerRadius = 4
            lblMoviePrice.clipsToBounds = true
        }
    }
    @IBOutlet weak var lblNameMovie: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgAvatar.layer.cornerRadius = 10
    }
    
}
