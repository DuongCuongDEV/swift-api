//
//  DetailViewController.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 10/05/2023.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var movies: Movies = []
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblTB: UILabel!
    @IBOutlet weak var textDetail: UITextView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.layer.cornerRadius = 10
        }
    }
    
    var movie: Movie?
    var idVideo: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: movie!.avatar)
        img.kf.setImage(with: url)
        lblName.text = movie?.name
        textDetail.text = movie?.info
        textDetail.isEditable = false
        lblPrice.text = movie?.price
        
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
    
    @IBAction func btnAdd(_ sender: UIButton) {
        let movie = Movie(info: "\(movie!.info)", name: "\(movie!.name)", avatar: "\(movie!.avatar)", price: "\(movie!.price)", link: "\(movie!.link)", id: "\(movie!.id)")
        APIHandler().postMovie(movie: movie)
        lblTB.text = "Thêm thành công"
        
    }
    @IBAction func btnPlay(_ sender: Any) {
        guard let movie = movie else {
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewControllerPlayVideo") as! ViewControllerPlayVideo
        getIdVideo(videoURL: movie.link)
        vc.idVideo = idVideo
        present(vc, animated: true)
    }
}
