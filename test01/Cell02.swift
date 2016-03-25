//
//  Cell02.swift
//  test01
//
//  Created by ddLiuYun on 16/3/22.
//  Copyright © 2016年 LiuYun. All rights reserved.
//

import UIKit

class Cell02: UICollectionViewCell {
    let desLable = UILabel()
    let bigPic = UIImageView()
    var imageFrame:CGRect?
    override func awakeFromNib() {
        super.awakeFromNib()
        let desLabel = UILabel()
        self.contentView.addSubview(bigPic)
        desLabel.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 20
        desLable.backgroundColor = UIColor.redColor()
        desLable.numberOfLines = 0
        self.contentView.addSubview(desLable)
    }
    
    var eye:Eye?{
        didSet{
            bigPic.image = UIImage(named: eye!.image!)
            bigPic.frame = imageFrame!
            bigPic.frame.origin.y = 0
            desLable.frame = CGRect(x: 0, y: bigPic.bounds.height, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - 64 - bigPic.bounds.height)

            desLable.text = eye?.des
        }
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//    }

    
   

}
