//
//  YH_ext_vc.swift
//  SecondsTimer
//
//  Created by 林宁宁 on 2017/5/13.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

public enum YHNavcBarPos : Int{
    case left
    case right
}

extension UIViewController{
    
//    var navRightBar : UIButton?
//    var navLeftBar : UIButton?
    
    public func yh_navc_bar(size:CGSize = CGSize(width: 40, height: 30), pos:YHNavcBarPos, clickBlock:(()->Void)?, btnBlock:(_ sender:UIButton)->Void?) -> Void {
        
        let barBtn : UIButton = UIButton(type: UIButtonType.custom)
        
        barBtn.frame = CGRect(origin: CGPoint.zero, size: size)
        barBtn.imageView?.contentMode = .scaleAspectFit
        barBtn.setTitleColor(UIColor.white, for: .normal)
        barBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        btnBlock(barBtn)
        
        barBtn.reactive.controlEvents(UIControlEvents.touchUpInside).observeResult { (result) in
            
            clickBlock?()
        }
        
        let itemSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        itemSpace.width = -15
        
        var barItems : [UIBarButtonItem] = [UIBarButtonItem]()
       
        if pos == .right{
            if self.navigationItem.rightBarButtonItems != nil{
                barItems += self.navigationItem.rightBarButtonItems!
            }
        }else{
            if self.navigationItem.leftBarButtonItems != nil{
                barItems += self.navigationItem.leftBarButtonItems!
            }
        }
        
        barItems.append(itemSpace)
        barItems.append(UIBarButtonItem.init(customView: barBtn))
        
        if pos == .right{
            self.navigationItem.rightBarButtonItems = barItems
        }else{
            self.navigationItem.leftBarButtonItems = barItems
        }
    }
    
    
    public func yh_bar_index(_ index:Int, pos:YHNavcBarPos)->UIButton?{
        var list = self.navigationItem.rightBarButtonItems
        if pos == .left {
            list = self.navigationItem.leftBarButtonItems
        }
        
        guard  list != nil else {
            return nil
        }
        
        guard  list!.count > 0 else {
            return nil
        }
        
        var step = 0
        
        for item in list!{
            
            if item.customView is UIButton {
                
                if step == index{
                    return item.customView as? UIButton
                }
                
                step += 1
            }
        }
        return nil
    }
    
}
