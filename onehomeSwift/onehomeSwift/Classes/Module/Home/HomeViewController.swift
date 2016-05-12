//
//  HomeViewController.swift
//  OneHome
//
//  Created by 北京一游网络有限公司 on 16/5/11.
//  Copyright © 2016年 yiyou. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()

        let param:[String:AnyObject] = ["range":["page":"0","pageSize":"10"],"typeNum":"1","isCurrency":"1"];
        NetworkTool.shareManager().getDataFromServer("onehome/house/getHomePageList", param: param) { result in
            
            print(result)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBarHidden = false
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
