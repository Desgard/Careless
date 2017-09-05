//
//  CareListViewController.swift
//  Careless
//
//  Created by 段昊宇 on 2017/9/1.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import RxViewController

class CareListViewController: UIViewController {
    
    var tableView: UITableView!
    let reuseIdentifier = "cell"
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Account>>()
    let viewModel = CareBasicViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
        initialDatas()
        initialActions()
        initialLayouts()
    }
    
    private func initialViews() {
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = UIColor.carelessColor
        
        view.addSubview(tableView)
    }
    
    private func initialDatas() {
        dataSource.configureCell = {
            _, tableView, indexPath, account in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
            cell.textLabel?.text = account.username
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .clear
            return cell
        }
        
        viewModel.getAccontList()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func initialActions() {
        tableView.rx
            .itemSelected
            .map { return $0 }
            .withLatestFrom(viewModel.getAccontList()) { return ($0, $1) }
            .subscribe(
                onNext: { indexPath, account in
                    self.tableView.deselectRow(at: indexPath, animated: true)
                }
            )
            .disposed(by: disposeBag)
    }
    
    private func initialLayouts() {
        
    }
}
