//
//  UISearchBarExtension.swift
//  Careless
//
//  Created by Harry Twan on 06/09/2017.
//  Copyright © 2017 Desgard_Duan. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    var textField: UITextField? {
        get {
            for subview in subviews {
                if subview is UITextField {
                    return subview as? UITextField
                }
            }
            return nil
        }
    }
    
}
