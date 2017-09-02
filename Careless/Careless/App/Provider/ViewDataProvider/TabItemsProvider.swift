//
//  TabItemsProvider.swift
//  Careless
//
//  Created by 段昊宇 on 2017/9/2.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class TabItemsProvider {
    static let items = {
        return [
            TabItem(
                title: "Password",
                tintColor: UIColor.red,
                normalImage: #imageLiteral(resourceName: "user_normal"),
                highlightImage: #imageLiteral(resourceName: "user_highlight")
            ),
            TabItem(
                title: "Password",
                tintColor: UIColor.blue,
                normalImage: #imageLiteral(resourceName: "user_normal"),
                highlightImage: #imageLiteral(resourceName: "user_highlight")
            ),
        ]
    }()
}
