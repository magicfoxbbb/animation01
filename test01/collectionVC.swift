//
//  collectionVC.swift
//  test01
//
//  Created by ddLiuYun on 16/3/22.
//  Copyright © 2016年 LiuYunsdjflsjdlfj. All rights resegrved.
//

import UIKit
protocol disMisDelegate:NSObjectProtocol{
    func didDismissed(indexPath:NSIndexPath)
}
private let reuseIdentifier = "Cell02"

class collectionVC: UICollectionViewController,UIGestureRecognizerDelegate {
    weak var delegate:disMisDelegate?
    var indexPathPassed:NSIndexPath?
    var eyes:[Eye]?
    var cellFrame:CGRect?
    override func viewDidLoad() {
        super.viewDidLoad()
        installsStandardGestureForInteractiveMovement = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: #selector(collectionVC.dismiss))
        
        automaticallyAdjustsScrollViewInsets = false
        collectionView?.frame.origin.y = 64
        collectionView?.registerNib(UINib(nibName: "Cell02", bundle: nil), forCellWithReuseIdentifier: "Cell02")
        collectionView?.scrollToItemAtIndexPath(indexPathPassed!, atScrollPosition: .Left, animated: true)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return eyes!.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? Cell02
        let eye = eyes![indexPath.row]
        cell!.imageFrame = cellFrame
        cell!.eye = eye
        return cell!
    }
    func dismiss(){
        let row = Int((collectionView?.contentOffset.x)! / (collectionView?.bounds.width)!)
        let indexPath = NSIndexPath(forRow: row, inSection: 0)
        delegate?.didDismissed(indexPath)
        navigationController?.popViewControllerAnimated(false)
    }
    
    
    
    


}
