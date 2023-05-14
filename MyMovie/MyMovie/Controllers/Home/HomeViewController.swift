//
//  HomeViewController.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 08/05/2023.
//

import UIKit

protocol MovieViewDelegate: AnyObject {
    func clickPushDetail(movie: Movie)
 }
class HomeViewController: UIViewController {
   
    

    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.register(UINib(nibName: HeaderView.className, bundle: nil), forCellWithReuseIdentifier: HeaderView.className)
            
            collectionView.register(UINib(nibName: PopularSection.className, bundle: nil), forCellWithReuseIdentifier: PopularSection.className)
            
            collectionView.register(UINib(nibName: NewSection.className, bundle: nil), forCellWithReuseIdentifier: NewSection.className)
            
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    private var movieData: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMoviesFromAPI()
    }
    
    func getMoviesFromAPI() {
        
        APIHandler.init().getMovies { [self] moviesResponse in
            self.movieData = moviesResponse
            print(movieData)
        }
    }

    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch SectionType.allCases[indexPath.section] {
            
        case .PopularSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSection.className, for: indexPath) as! PopularSection
            cell.delegate = self
            return cell
            
        case .HeaderView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderView.className, for: indexPath) as! HeaderView
            return cell
        case .NewSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewSection.className, for: indexPath) as! NewSection
            cell.delegate = self
            return cell
            
        }
        
        
        
    }
    }
    


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = collectionView.frame.width
        switch SectionType.allCases[indexPath.section] {
            
        case .HeaderView:
            return CGSize(width: cellWidth - 25, height: 330)
            
        case .PopularSection:
            return CGSize(width: cellWidth - 32 , height: 320)
            
        case .NewSection:
            return CGSize(width: cellWidth - 32, height: 300)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch SectionType.allCases[section] {
            
        case .HeaderView:
            return UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16)
            
        case .PopularSection:
            return UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16)
            
        case .NewSection:
            return UIEdgeInsets(top: 24, left: 16, bottom: 16, right: 16)
            
        }
    }
}
extension HomeViewController: MovieViewDelegate {
    func clickPushDetail(movie: Movie) {
        let vc = DetailViewController()
        vc.movie = movie
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
