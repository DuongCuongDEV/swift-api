//
//  NewSection.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 09/05/2023.
//

import UIKit

class NewSection: UICollectionViewCell {
    weak var delegate: MovieViewDelegate?

    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: NewCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: NewCollectionViewCell.className)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    
    private var listItem: Movies = []
    
    var listItemControl: Movies = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("12345")
        self.getMoviesFromAPI()
        
    }
    
    
    func getMoviesFromAPI() {
        APIHandler.init().getMovies{ [self]moviesResponse in
            
            for item in moviesResponse {
                if(Int(item.id)! % 2 == 0){
                    listItemControl.append(item)
                }
            }
            self.listItem = moviesResponse
            self.collectionView.reloadData()
        }
        
    }
    
}

extension NewSection: UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listItemControl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCollectionViewCell.className, for: indexPath) as! NewCollectionViewCell
        
        cell.layer.cornerRadius = 10 // Chỉnh độ cong của góc
        cell.layer.backgroundColor = UIColor.white.cgColor // Nếu không set màu background thì shadow không hiện
        cell.layer.borderWidth = 0.1 // Nếu không set borderWidth thì shadow không hiện
        cell.layer.borderColor = UIColor.clear.cgColor // Nếu không set borderColor thì shadow không hiện
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 4
        cell.layer.masksToBounds = false
        
        let url = URL(string: listItemControl[indexPath.row].avatar)
        cell.imgNew.kf.setImage(with: url)
        cell.lblPriceNew.text = listItemControl[indexPath.row].price
        cell.lblNameNew.text = listItemControl[indexPath.row].name
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.listItem[indexPath.row]
        self.delegate?.clickPushDetail(movie: movie)
    }

   
    
    
    
    
}

extension NewSection: UICollectionViewDelegateFlowLayout {



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 410, height: collectionView.frame.height - 20)
    }

}




