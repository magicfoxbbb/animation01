//
//  Eye.swift
//  test01
//
//  Created by LiuYun on 16/3/22.
//  Copyright © dd年 LiuYun. All rights reserved.
//

import Foundation

class Eye:NSObject{
    var image:String?
    var des:String?
    
    override init() {
        super.init()
    }
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    


}