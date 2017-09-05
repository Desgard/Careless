//
//  CareBasicModel.swift
//  Careless
//
//  Created by 段昊宇 on 2017/9/2.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

struct Account: CareBasicModelProtocol {
    let username: String
    let password: String
    let email: String
    let website: String
    let icon: UIImage?
}
