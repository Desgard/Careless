//
//  CareBasicViewModel.swift
//  Careless
//
//  Created by Harry Twan on 05/09/2017.
//  Copyright © 2017 Desgard_Duan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class CareBasicViewModel: NSObject {
    
    let accounts: [Account] = []
    
    let accountsTest = [
        Account(username: "Desgard_Duan", password: "123456", email: "gua@desgard.com", website: "https://github.com", type: .social, icon: nil),
        Account(username: "Desgard_Duan", password: "123456", email: "gua@desgard.com", website: "https://github.com", type: .life, icon: nil),
    ]
    
    public func getAccontList() -> Observable<[SectionModel<String, Account>]> {
        return Observable.create({ observer -> Disposable in
            // 暂时给出测试数据
            let accounts = self.accountsTest
            let section = [SectionModel(model: "", items: accounts)]
            observer.onNext(section)
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
