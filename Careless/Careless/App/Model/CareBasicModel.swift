//
//  CareBasicModel.swift
//  Careless
//
//  Created by 段昊宇 on 2017/9/2.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

struct Account: CareBasicModelProtocol {
    
    enum Category: String {
        case social = "Social Media"
        case email = "Email"
        case life = "Life"
        case entertainment = "Entertainment"
        case study = "Study Online"
        case bbs = "BBS"
        case other = "Other"
    }
    
    let username: String
    let password: String
    let email: String
    let website: String
    let type: Account.Category
    let icon: UIImage?
}
