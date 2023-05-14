//
//  HomeViewController.swift
//  Food
//
//  Created by Dương Văn Cường on 10/05/2023.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    

    @IBOutlet weak var clv2: UICollectionView!
//    {
//        self.clv2.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
//
//        self.clv2.delegate = self
//        self.clv2.dataSource = self
//    }
    @IBOutlet weak var clv1: UICollectionView!
//    {
//        self.clv1.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
//
//        self.clv1.delegate = self
//        self.clv1.dataSource = self
//    }
    
    var listItem: Foods = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.clv2.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        self.clv1.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        self.clv1.delegate = self
        self.clv1.dataSource = self
        
//        self.clv2.delegate = self
//        self.clv2.dataSource = self

        // Do any additional setup after loading the view.
        self.getFoodsFromAPI()
        
    }
    

    func getFoodsFromAPI() {
        print("assj")
        APIHandler.init().getFoods { foodsResponse in
            self.listItem = foodsResponse
            print(self.listItem)
            self.clv1.reloadData()
//            self.clv2.reloadData()
//            print("dsdsd")
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        
        let url = URL(string: listItem[indexPath.row].avatar)
        cell.img.kf.setImage(with: url)
        cell.lblPrice.text = listItem[indexPath.row].price
        cell.lblName.text = listItem[indexPath.row].name
        return cell
    }
    

}
