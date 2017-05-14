//
//  YHHomeViewController.swift
//  SecondsTimer
//
//  Created by 林宁宁 on 2017/5/13.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class YHHomeViewController: YHBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "秒表"
        self.view.backgroundColor = UIColor.hex("f5f5f5")
        self.isCustomBackBtn = true
        self.yh_navc_bar(pos: .right, clickBlock: { [weak self] in
            
            let detailvc = YHDetailViewController()
            self?.navigationController?.pushViewController(detailvc, animated: true)
            
        }) { (sender) -> Void? in
            
            sender.setTitle("详情", for: .normal)
        }
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
