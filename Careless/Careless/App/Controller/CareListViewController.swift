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
    
    private var tableView: UITableView!
    private var searchBar: UISearchBar!
    
    private let reuseIdentifier = "cell"
    private let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Account>>()
    private let viewModel = CareBasicViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
        initialDatas()
        initialActions()
        initialLayouts()
    }
    
    private func initialViews() {
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: UIColor.tabbarColor), for: .default)
        
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.carelessColor
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.register(CareListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        searchBar = UISearchBar.init()
        searchBar.barStyle = .black
        searchBar.barTintColor = UIColor.tabbarColor
        searchBar.placeholder = "Filter Keywords"
        searchBar.setBackgroundImage(UIImage.imageWithColor(color: UIColor.tabbarColor), for: .any, barMetrics: .default)
        
        view.addSubview(tableView)
        view.addSubview(searchBar)
    }
    
    private func initialDatas() {
        dataSource.configureCell = {
            _, tableView, indexPath, account in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! CareListTableViewCell
            cell.account = account
            cell.backgroundColor = .clear
            return cell
        }
        
        dataSource.titleForHeaderInSection = {
            ds, index in
            return "Social Media"
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
        
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .filter{ return $0.characters.count == 0 }
            .subscribe(onNext: { _ in self.searchBar.resignFirstResponder() })
            .disposed(by: disposeBag)
    
    }
    
    private func initialLayouts() {
        
        searchBar.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.searchBar.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        }
    }
}
