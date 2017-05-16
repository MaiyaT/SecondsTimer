//
//  YHHomeViewController.swift
//  SecondsTimer
//
//  Created by 林宁宁 on 2017/5/13.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit
import SnapKit

class YHHomeViewController: YHBaseViewController {

    private var timer : Timer!

    private var time_hour = 0
    
    private var _time_minutes = 0
    private var time_minutes : Int {
        get{
            return _time_minutes
        }
        set{
            _time_minutes = newValue
            if _time_minutes > 59{
                _time_minutes = 0
                time_hour += 1
            }
        }
    }
    
    private var _time_seconds = 0
    private var time_seconds : Int{
        get{
            return _time_seconds
        }
        set{
            _time_seconds = newValue
            if _time_seconds > 59{
                _time_seconds = 0
                time_minutes += 1
            }
        }
    }
    
    private var _time_millisecond = 0
    private var time_millisecond : Int{
        get{
            return _time_millisecond
        }
        set{
            _time_millisecond = newValue
            if _time_millisecond > 99{
                _time_millisecond = 0
                time_seconds += 1
            }
        }
    }
    
    private var display_lab_v : YHTimeDisplayV!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "秒表"
        self.view.backgroundColor = UIColor.hex("d1d1d1")
        self.isCustomBackBtn = true
        self.yh_navc_bar(pos: .right, clickBlock: { [weak self] in
            
            let detailvc = YHDetailViewController()
            self?.navigationController?.pushViewController(detailvc, animated: true)
            
        }) { (sender) -> Void? in
            
            sender.setTitle("详情", for: .normal)
        }
     
    }
    
    override func buildContentViewWillAppear() {
        
        display_lab_v = YHTimeDisplayV()
        display_lab_v.buildDisplayV()
        self.view.addSubview(display_lab_v)
        display_lab_v.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(100)
        }
        
        
        
        timer = Timer(timeInterval: 0.01, target: self, selector: #selector(timer_action), userInfo: nil, repeats: true)
        
        RunLoop.current.add(timer, forMode: .commonModes)
        
        timer.fire()
    }
    
    override func backEvent() {
        
        timer.invalidate()
        timer = nil
    }
    
    
    
    // MARK: 定时器
    func timer_action() -> Void {
        
        time_millisecond += 1
        
        DispatchQueue.main.async {
         
            self.display_lab_v.time_lab_show_h.text = String(format: "%02d", self.time_hour)
            self.display_lab_v.time_lab_show_m.text = String(format: "%02d", self.time_minutes)
            self.display_lab_v.time_lab_show_s.text = String(format: "%02d", self.time_seconds)
            self.display_lab_v.time_lab_show_ms.text = String(format: "%02d", self.time_millisecond)
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
