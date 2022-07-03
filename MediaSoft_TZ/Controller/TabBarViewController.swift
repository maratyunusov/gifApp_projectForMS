//
//  TabBarViewController.swift
//  MediaSoft_TZ
//
//  Created by Marat Yunusov on 02.07.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var accessTokenForContent1: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.searchController = searchController
        self.viewControllers?.forEach({ viewController in
            if let vc = viewController as? ContentViewController {
                vc.accessTokenForContent = accessTokenForContent1
            }
        })
    }
}

