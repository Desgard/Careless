//
//  ViewController.swift
//  Careless
//
//  Created by 段昊宇 on 2017/8/30.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import SwipeableTabBarController

struct User {
    let followersCount: Int
    let followingCount: Int
    let screenName: String
}

class ViewModel: NSObject {
    func getUsers() -> Observable<[SectionModel<String, User>]> {
        return Observable.create { (observer) -> Disposable in
            let users = [User(followersCount: 19_901_990, followingCount: 1990, screenName: "Marco Sun"),
                         User(followersCount: 19_890_000, followingCount: 1989, screenName: "Taylor Swift"),
                         User(followersCount: 250_000, followingCount: 25, screenName: "Rihanna"),
                         User(followersCount: 13_000_000_000, followingCount: 13, screenName: "Jolin Tsai"),
                         User(followersCount: 25_000_000, followingCount: 25, screenName: "Adele")]
            let section = [SectionModel(model: "", items: users)]
            observer.onNext(section)
            observer.onCompleted()
            return Disposables.create()
        }
    }
}

class SampleTableViewController: UIViewController {
    let tableView: UITableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
    let reuseIdentifier = "cell"

    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>()
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        dataSource.configureCell = {
            _, tableView, IndexPath, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: IndexPath)
            cell.tag = IndexPath.row
            cell.textLabel?.text = user.screenName
            return cell
        }
        
        viewModel.getUsers()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
    }
}

class CareTabController: SwipeableTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
