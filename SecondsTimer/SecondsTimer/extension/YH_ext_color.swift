//
//  YH_ext_color.swift
//  SecondsTimer
//
//  Created by 林宁宁 on 2017/5/13.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

//import YYKit

// MARK: colors
extension UIColor{
    
    class func RGB(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: 1);
    }
    
    class func RGBA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a);
    }
    
    class func hex(_ hexStr:String) -> UIColor {
        
        var cString: String = hexStr.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if cString.characters.count < 6 {
            return UIColor.black
        }
        if cString.hasPrefix("0X") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
        }
        if cString.hasPrefix("#") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
        }
        if cString.characters.count != 6 {
            return UIColor.black
        }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1);        
    }
    
    /// 黑色
    public class var color1a1a1a : UIColor { return UIColor.hex("1a1a1a") }
    /// 红色
    public class var color00aaff : UIColor { return UIColor.hex("00aaff") }
}


// MARK: Color to image
extension UIColor{

    func drawToImage(_ imgSize:CGSize = CGSize(width: 10, height: 10)) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(imgSize, false, UIScreen.main.scale)
        
        self.set()
        UIRectFill(CGRect(origin: CGPoint.zero, size: imgSize))
        let pressedColorImg : UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        
        UIGraphicsEndImageContext()
        
        return pressedColorImg
    }
    
}
