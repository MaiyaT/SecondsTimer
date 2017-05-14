//
//  YH_ext_object.swift
//  SecondsTimer
//
//  Created by 林宁宁 on 2017/5/13.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

extension NSObject{
    
    public func APPBundleName() -> String {

        let nameKey = "CFBundleName"
        let appName = Bundle.main.object(forInfoDictionaryKey: nameKey) as? String
        
        return appName!
    }
    
//    public func yh_class() -> AnyClass {
//        let obj_class = NSClassFromString(APPBundleName()+"."+self.className())
//    }
}
