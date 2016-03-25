//
//  MyLayout.swift
//  test01
//
//  Created by LddiuYun on 16/3/22.
//  Copyright © 2016年 LiuYun. All rights reserved.
//

import UIKit

class MyLayout: UICollectionViewFlowLayout {

    override func prepareLayout() {
        super.prepareLayout()
        scrollDirection = .Horizontal
        itemSize = CGSize(width: collectionView!.bounds.width, height: collectionView!.bounds.height)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        collectionView?.pagingEnabled = true
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attrs = super.layoutAttributesForElementsInRect(rect)
        return attrs
    }
    
}
