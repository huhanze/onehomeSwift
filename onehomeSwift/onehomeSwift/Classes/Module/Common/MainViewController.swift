//
//  MainViewController.swift
//  OneHome
//
//  Created by 北京一游网络有限公司 on 16/5/11.
//  Copyright © 2016年 yiyou. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addChildViewControllers()
    }

    func addChildViewControllers(){
        addChildViewController(HomeViewController(), titleName: "主页", imageName: "tabBar_Home")
        addChildViewController(CollectionViewController(), titleName: "收藏", imageName: "tabBar_Collect")
        addChildViewController(MessageViewController(), titleName: "消息", imageName: "tabBar_Message")
        addChildViewController(PersonalViewController(), titleName: "我的", imageName: "tabBar_My")
    }
    
    /// 添加控制器
    func addChildViewController(vc: UIViewController, titleName: String, imageName: String){
        
//        vc.title = titleName
        if !imageName.isEmpty {
            vc.tabBarItem.image = UIImage(named: imageName)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            vc.tabBarItem.selectedImage = UIImage(named: imageName + "_Selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        }
        
        let nav = UINavigationController(rootViewController: vc)
        
        addChildViewController(nav)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
