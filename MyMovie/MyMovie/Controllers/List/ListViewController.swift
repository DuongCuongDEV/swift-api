//
//  ListViewController.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 08/05/2023.
//

import UIKit


class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var movies : Movies = []
    var total: Int = 0;
    
    
    @IBOutlet weak var lblSumPrice: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    
    var idVideo: String = ""
    @IBOutlet weak var clvList: UICollectionView! {
        didSet{
            clvList.register(UINib(nibName: ListMovieCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: ListMovieCollectionViewCell.className)
            clvList.delegate = self
            clvList.dataSource = self
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        total = 0
        getMoviesFromAPI()
        
        lblNumber.text = "Số lượng phim đã lưu: \(movies.count)"
    }
    
    func calculateTotalPrice() -> Int {
        var totalPrice = 0
        for movie in movies {
            totalPrice += Int(movie.price) ?? 0
        }
        return totalPrice
    }
    
    func getMoviesFromAPI()  {
        APIHandler.init().getCartMovies{ [self]cartMoviesResponse in
            for movie in cartMoviesResponse {
                total += Int(Double(movie.price) ?? 0)
            }
            
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale.current
            numberFormatter.numberStyle = .currency
            let formattedPrice = numberFormatter.string(from: NSNumber(value: total)) ?? ""
            
            lblSumPrice.text = "Tổng số tiền thuê: \(formattedPrice)"
            lblNumber.text = "Số lượng phim đã lưu: \(cartMoviesResponse.count)"
            
            self.movies = cartMoviesResponse
            self.clvList.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListMovieCollectionViewCell.className, for: indexPath) as! ListMovieCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.1
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 4
        cell.layer.masksToBounds = false
        
        
        let url = URL(string: movies[indexPath.row].avatar)
        cell.img.kf.setImage(with: url)
        cell.lblPrice.text = movies[indexPath.row].price
        cell.lblName.text = movies[indexPath.row].name
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewControllerPlayVideo") as! ViewControllerPlayVideo
        getIdVideo(videoURL: movies[indexPath.row].link)
        vc.idVideo = idVideo
        print(idVideo)
        present(vc, animated: true)
    }
    
    func getIdVideo(videoURL: String){
        let pattern = "(?<=v=)[^&]+"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: videoURL.utf16.count)
        if let match = regex.firstMatch(in: videoURL, options: [], range: range) {
            let videoID = (videoURL as NSString).substring(with: match.range)
            idVideo = videoID
        }
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        let id = String(movies[sender.tag].id)
        APIHandler.init().deleteMovie(_id: id)
        if let index = movies.firstIndex(where: { $0.id == id }) {
            movies.remove(at: index)
        }
        total = 0
        getMoviesFromAPI()
        clvList.reloadData()
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 200)
    }
}
