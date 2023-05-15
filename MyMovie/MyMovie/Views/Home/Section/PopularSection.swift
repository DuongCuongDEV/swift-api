//
//  PopularSection.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 09/05/2023.
//

import UIKit
import Kingfisher


class PopularSection: UICollectionViewCell {
    
    weak var delegate: MovieViewDelegate?
    
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: PopularCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.className)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    
    private var listItem: Movies = []
    override func awakeFromNib() {
        super.awakeFromNib()
        self.getMoviesFromAPI()
        
        
    }
    
    
    func getMoviesFromAPI() {
        APIHandler.init().getMovies{moviesResponse in
            self.listItem = moviesResponse
            self.collectionView.reloadData()
        }
        
    }
    
}

extension PopularSection: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.className, for: indexPath) as! PopularCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.1
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 4
        cell.layer.masksToBounds = false
        
        
        
        
        let url = URL(string: listItem[indexPath.row].avatar)
        cell.imgAvatar.kf.setImage(with: url)
        cell.lblMoviePrice.text = listItem[indexPath.row].price
        cell.lblNameMovie.text = listItem[indexPath.row].name
        
        
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.listItem[indexPath.row]
        self.delegate?.clickPushDetail(movie: movie)
    }
}

extension PopularSection: UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: collectionView.frame.height - 30)
    }
    
}




