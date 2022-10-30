//
//  ViewController.swift
//  LondraMidyecisi
//
//  Created by Burak Altunoluk on 29/10/2022.
//

import UIKit

final class MainVC: UIViewController {
    
    @IBOutlet private var cekilisImageVıew: UIImageView!
    @IBOutlet private var orderImageView: UIImageView!
    @IBOutlet private var pageController: UIPageControl!
    @IBOutlet private var collectionView: UICollectionView!
    private let screenSize = UIScreen.main.bounds.width
    private var imageArray = [UIImage(named: "my1"),UIImage(named: "my2"),UIImage(named: "my4")]
    private var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cekilisImageVıew.layer.cornerRadius = 30
        self.orderImageView.layer.cornerRadius = 30
        self.collectionView.frame = CGRect(x: 0, y: 0, width: Int(screenSize), height: Int(UIScreen.main.bounds.height) / 5)
        pageController.numberOfPages = imageArray.count
        pageController.currentPage = 0
        
    }
    
}

extension MainVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: screenSize  , height: cell.bounds.height ))
        imageview.image = self.imageArray[indexPath.row]
        imageview.contentMode = .scaleToFill
        cell.addSubview(imageview)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageController.currentPage = indexPath.row

    }
    
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: screenSize  , height: UIScreen.main.bounds.height / 5)
    }
}

extension MainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}


