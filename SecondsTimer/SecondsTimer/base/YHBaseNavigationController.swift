//
//  YHBaseNavigationController.swift
//  SecondsTimer
//
//  Created by 林宁宁 on 2017/5/13.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class YHBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navcStyle()
    }

    func navcStyle() -> Void {
        
        self.navigationBar.setBackgroundImage(UIColor.color1a1a1a.drawToImage(), for: UIBarMetrics.default)
        self.navigationBar.tintColor = UIColor.color00aaff
        
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]

        self.navigationBar.shadowImage = UIImage()
        
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
