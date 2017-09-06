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
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    fileprivate let userLabel: UILabel = {
        let label = UILabel()
        label.text = "identify"
        label.textColor = UIColor.subtitleFontColor
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    fileprivate let iconImageView: UIImageView = {
        let image = UIImage.init(named: "github")!.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView.init(image: image)
        imageView.tintColor = UIColor.white
        return imageView
    }()
    
    fileprivate let topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.separatorLineColor
        return view
    }()
    
    fileprivate let botLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.separatorLineColor
        return view
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
        addSubview(iconImageView)
        addSubview(topLineView)
        addSubview(botLineView)
    }
    
    private func initialLayouts() {
        
        webSiteLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.left.equalTo(self.iconImageView.snp.right).offset(20)
        }
        
        userLabel.snp.makeConstraints { make in
            make.top.equalTo(self.webSiteLabel.snp.bottom).offset(10)
            make.left.equalTo(self.webSiteLabel)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(webSiteLabel)
            make.bottom.equalTo(userLabel)
            make.left.equalTo(self.snp.left).offset(15)
            make.width.equalTo(iconImageView.snp.height)
        }
        
        topLineView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(1)
        }
        
        botLineView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}

extension CareListTableViewCell {
    public func hideBotLine() { botLineView.isHidden = true }
    public func hideTopLine() { topLineView.isHidden = true }
}
