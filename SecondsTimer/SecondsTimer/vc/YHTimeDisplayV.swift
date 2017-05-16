//
//  YHTimeDisplay.swift
//  SecondsTimer
//
//  Created by 林宁宁 on 2017/5/16.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class YHTimeDisplayV: UIView {

    lazy var time_lab_show_h : UILabel = {
        let time_lab_show = UILabel()
        time_lab_show.textAlignment = .center
        time_lab_show.textColor = UIColor.white
        time_lab_show.font = UIFont.systemFont(ofSize: 30)
        return time_lab_show
    }()
    lazy var time_lab_show_m : UILabel = {
        let time_lab_show = UILabel()
        time_lab_show.textAlignment = .center
        time_lab_show.textColor = UIColor.white
        time_lab_show.font = UIFont.systemFont(ofSize: 50)
        return time_lab_show
    }()
    lazy var time_lab_show_s : UILabel = {
        let time_lab_show = UILabel()
        time_lab_show.textAlignment = .center
        time_lab_show.textColor = UIColor.white
        time_lab_show.font = UIFont.systemFont(ofSize: 50)
        return time_lab_show
    }()
    lazy var time_lab_show_ms : UILabel = {
        let time_lab_show = UILabel()
        time_lab_show.textAlignment = .center
        time_lab_show.textColor = UIColor.white
        time_lab_show.font = UIFont.systemFont(ofSize: 50)
        return time_lab_show
    }()
    
    
    func buildDisplayV() -> Void {
        
//        time_lab_show_h.backgroundColor = UIColor.red
//        time_lab_show_m.backgroundColor = UIColor.green
//        time_lab_show_s.backgroundColor = UIColor.blue
//        time_lab_show_ms.backgroundColor = UIColor.yellow
        
        self.addSubview(time_lab_show_h)
        self.addSubview(time_lab_show_m)
        self.addSubview(time_lab_show_s)
        self.addSubview(time_lab_show_ms)
        
        time_lab_show_h.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.25)
        }
        time_lab_show_m.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self.time_lab_show_h.snp.right)
            make.width.equalTo(self).multipliedBy(0.25)
        }
        time_lab_show_s.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self.time_lab_show_m.snp.right)
            make.width.equalTo(self).multipliedBy(0.25)
        }
        time_lab_show_ms.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self.time_lab_show_s.snp.right)
            make.width.equalTo(self).multipliedBy(0.25)
        }
    }

}
