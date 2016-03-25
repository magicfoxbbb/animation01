
//
//  ViewController.swift
//  test01
//
//  Created by LiuYun on 16/3/22.
//  Copyright © 2016年 LiuYun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,disMisDelegate {
    var eyes = [Eye]()
    var tempFrame:CGRect?
    let desView = UIView()

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //测试数据
        let dict1 = ["image":"1","des":"宋文哦认为 u 哦若为 u 肉闻风丧胆家乐福是加夫里什家里附近阿拉斯加到了附近阿斯利康发动机拉萨江东父老扩大数据来看风景阿里斯顿解放了大街上了飞机啊的刷卡机风口浪尖阿萨德立法局阿拉斯加的福利"]
        let dict2 = ["image":"2","des":"v 处女秀，美女空姐后否肉味为人颇为人啊速度减肥卢卡斯金德拉克飞机阿拉山口的肌肤立刻撒娇的路口附近阿里斯顿就费拉达斯解放啦解放啦卡教练发酵；福建阿斯科利 "]
        let dict3 = ["image":"3","des":"科学家否谁都佛无饿哦佛教界上的老骥伏枥圣诞节打开算法卢卡斯金德拉克飞机阿里的肌肤垃圾发；激发减肥卢卡斯肌肤立刻撒的肌肤空间看了电视剧啊风口浪尖"]
        let dict4 = ["image":"4","des":"微弱俄无人机可绝对否定时卡的健身房里看见阿里斯顿克己复礼卡的肌肤卡拉胶开发力度将阿克琉斯附近的卡洛斯肌肤立刻睡觉了开发建设路口九分裤两色九分裤两世界的路口附近"]
        let eye1 = Eye(dict: dict1)
        let eye2 = Eye(dict: dict2)
        let eye3 = Eye(dict: dict3)
        let eye4 = Eye(dict: dict4)
        eyes.append(eye1)
        eyes.append(eye2)
        eyes.append(eye3)
        eyes.append(eye4)

    
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eyes.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let layout = MyLayout()
        let vc = collectionVC(collectionViewLayout: layout)
        vc.indexPathPassed = indexPath
        vc.eyes = eyes
        vc.delegate = self
//        vc.navigationItem.hidesBackButton = true
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        tempFrame = cell?.frame
        let detalY = (UIScreen.mainScreen().bounds.height - 64)/2/(cell!.bounds.height)
        desView.frame = CGRect(x: 0, y: (UIScreen.mainScreen().bounds.height - 64)/2 + tableView.contentOffset.y, width: UIScreen.mainScreen().bounds.width, height: 0)
        desView.backgroundColor = UIColor.redColor()
        tableView.addSubview(desView)
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            cell?.transform = CGAffineTransformScale(cell!.transform, 1.2, detalY)
            cell?.frame.origin.y = tableView.contentOffset.y
                self.desView.frame.size.height =  (UIScreen.mainScreen().bounds.height - 64)/2
        
            vc.cellFrame = cell?.frame
            }) { (_) -> Void in

                self.navigationController?.pushViewController(vc, animated: false)
                cell?.transform = CGAffineTransformIdentity
                cell?.frame = self.tempFrame!
                
        }
        }
    func didDismissed(indexPath: NSIndexPath) {
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .None, animated: false)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let detalY = (UIScreen.mainScreen().bounds.height - 64)/2/(cell!.bounds.height)
        cell?.transform = CGAffineTransformScale(cell!.transform, 1.2, detalY)
        cell?.frame.origin.y = tableView.contentOffset.y
        UIView.animateWithDuration(0.25, animations: {
            cell?.transform = CGAffineTransformIdentity
            cell?.frame.origin.y = CGFloat(indexPath.row)*(cell?.bounds.height)!
            self.desView.frame.size.height = 0
            }) { (_) in
            self.desView.removeFromSuperview()
        }

        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell01")
        let imageV = cell?.contentView.viewWithTag(1) as? UIImageView
        let eye = eyes[indexPath.row]
        imageV?.image = UIImage(named: eye.image!)
    
        return cell!
    }


}
