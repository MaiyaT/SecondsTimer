//
//  YHBaseViewController.swift
//  SecondsTimer
//
//  Created by 林宁宁 on 2017/5/13.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class YHBaseViewController: UIViewController {

    private var _isBuildedWillAppear : Bool = false
    private var _isBuildedDidAppear : Bool = false
    private var _isBuildedWillAppearDealay : Bool = false
    private var _isBuildedDidAppearDealay : Bool = false
    
    public var isCustomBackBtn : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        self.view.backgroundColor = UIColor.white
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(!_isBuildedWillAppear)
        {
            _isBuildedWillAppear = true;
            
            yh_base_backBarItem()
            
            buildContentViewWillAppear()
        }
        
        if(!_isBuildedWillAppearDealay)
        {
            _isBuildedWillAppearDealay = true;
            
            self.perform(#selector(buildContentViewWillAppearDelay), with: nil, afterDelay: 0.1)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.endEditing(true)
        self.navigationController?.view.endEditing(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.classForCoder.cancelPreviousPerformRequests(withTarget: self)
        
        if self.parent == nil{
            viewWillDeallocEvent()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if(!_isBuildedDidAppear)
        {
            _isBuildedDidAppear = true;
            
            buildContentViewDidAppear()
        }
        
        
        if(!_isBuildedDidAppearDealay)
        {
            _isBuildedDidAppearDealay = true;
            
            self.perform(#selector(buildContentViewDidAppearDelay), with: nil, afterDelay: 0.5)
        }
    }
    
    func buildContentViewWillAppear() {
        
    }
 
    
    func buildContentViewDidAppear() {
    
    }
    
    func buildContentViewWillAppearDelay() {
    
    }
    
    func buildContentViewDidAppearDelay() {
    
    }
    
    func viewWillDeallocEvent() {
        
    }
    
    fileprivate func yh_base_backBarItem() -> Void {
        
        self.navigationItem.backBarButtonItem = {
            let tempitem = UIBarButtonItem()
            tempitem.title = "返回"
            return tempitem
        }()
        
        if isCustomBackBtn == false{
            self.yh_navc_bar(pos: .left, clickBlock: {[weak self] in
                self?.backEvent()
            }, btnBlock: { (sender) -> Void? in
                sender.setImage(UIImage.init(named: "btn_back_nor_w"), for: UIControlState.normal)
            })
        }
    }
    
    func backEvent() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        
        print("###########________释放了视图 \(self.classForCoder)_______###########")
        
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
