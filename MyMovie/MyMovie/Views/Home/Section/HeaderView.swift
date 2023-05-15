//
//  HeaderView.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 09/05/2023.
//

import UIKit

class HeaderView: UICollectionViewCell {
    
    @IBOutlet weak var imgBanner: UIImageView! {
        didSet {
            imgBanner.layer.cornerRadius = 8
        }
    }
    
    
    var imageArray = [String]()
    var currentIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageArray.append("https://images.hdqwalls.com/wallpapers/the-batman-movie-poster-art-5k-ex.jpg")
        imageArray.append("https://cdn.wallpapersafari.com/17/9/N4g7lj.jpg")
        imageArray.append("https://wallpapershome.com/images/wallpapers/65-movie-3840x2160-adam-driver-4k-24468.jpg")
        
        let _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }
    
    @objc func changeImage() {
        if currentIndex == imageArray.count {
            currentIndex = 0
        }
        
        let url = URL(string: imageArray[currentIndex])
        imgBanner.kf.setImage(with: url)
        currentIndex += 1
    }
    
}
