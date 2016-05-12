//
//  MessageViewController.swift
//  OneHome
//
//  Created by 北京一游网络有限公司 on 16/5/11.
//  Copyright © 2016年 yiyou. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func loadView() {
        super.loadView()
        title = "消息"
        tabBarItem.title = nil
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
