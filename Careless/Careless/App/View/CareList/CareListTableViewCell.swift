//
//  CareListTableViewCell.swift
//  Careless
//
//  Created by Harry Twan on 05/09/2017.
//  Copyright © 2017 Desgard_Duan. All rights reserved.
//

import UIKit
import SnapKit

class CareListTableViewCell: UITableViewCell {
    
    public var account: Account? {
        didSet {
            guard let account = account else { return }
            webSiteLabel.text = account.website
            userLabel.text = account.username
        }
    }
    
    fileprivate let webSiteLabel: UILabel = {
        let label = UILabel()
        label.text = "website"
        label.textColor = .white
        return label
    }()
    
    fileprivate let userLabel: UILabel = {
        let label = UILabel()
        label.text = "identify"
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialViews()
        initialLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialViews() {
        addSubview(webSiteLabel)
        addSubview(userLabel)
    }
    
    private func initialLayouts() {
        
        webSiteLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.left.equalTo(self.snp.left).offset(20)
        }
        
        userLabel.snp.makeConstraints { make in
            make.top.equalTo(self.webSiteLabel.snp.bottom).offset(10)
            make.left.equalTo(self.webSiteLabel)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
    }
}
