//
//  ExpandedCell.swift
//  ExpandingTest2
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//
import Kingfisher
import UIKit

class ExpandedCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource  {
    
//    let imageProducs = ["1","2","3","4","5"]
    var arrImageURL : [URL]?
    var arrContentName : [String]?
    
    @IBOutlet weak var btnUpDownOutlet: UIButton!
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    @IBOutlet weak var lblHeading: UILabel!
    
    @IBOutlet weak var lblContents: UILabel!
    
    @IBOutlet weak var uIViewToBeHidden: UIView!
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    private let leftAndRightPadding: CGFloat = 2.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    
    class var expandedHeight: CGFloat {get { return 306}}
    
    class var defaultHeight: CGFloat {get {return 106}}
    
    override func awakeFromNib() {
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        
        let widthOfCollectionCell = (collectionViewOutlet.frame.width - leftAndRightPadding) / numberOfItemsPerRow
        let layout = collectionViewOutlet?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: widthOfCollectionCell, height: widthOfCollectionCell)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (arrImageURL?.count)!
//        return self.imageProducs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CollectionViewCell
//        cell.lblOfCollectionOutlet.text = self.imageProducs[indexPath.row]
        cell.lblOfCollectionOutlet.text = self.arrContentName?[indexPath.row]
        cell.imageViewOfCollectionOutlet.kf.setImage(with: arrImageURL?[indexPath.row])
        
        return cell
    }
}

