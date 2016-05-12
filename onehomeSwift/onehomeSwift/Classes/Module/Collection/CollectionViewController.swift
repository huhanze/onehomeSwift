//
//  CollectionViewController.swift
//  OneHome
//
//  Created by 北京一游网络有限公司 on 16/5/11.
//  Copyright © 2016年 yiyou. All rights reserved.
//

import UIKit

class CollectionViewController: BaseViewController {

    override func loadView() {
        super.loadView()
        title = "收藏"
        tabBarItem.title = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
