//
//  CareLaunchView.swift
//  Careless
//
//  Created by Harry Twan on 08/09/2017.
//  Copyright © 2017 Desgard_Duan. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class CareLaunchView: UIView {
    
    let animationView = LOTAnimationView(name: "care_launch")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialViews()
        initialLayouts()
    }
    
    private func initialViews() {
        backgroundColor = UIColor.carelessColor
        
        addSubview(animationView)
        animationView.play { _ in self.hide() }
    }
    
    private func initialLayouts() {
        animationView.snp.makeConstraints { make in
            make.centerY.equalTo(self).offset(-20)
            make.centerX.equalTo(self).offset(10)
        }
    }
    
    public func hide() {
        UIView.animate(withDuration: 0.5, animations: { 
            self.alpha = 0
        }) { _ in self.removeFromSuperview() }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
