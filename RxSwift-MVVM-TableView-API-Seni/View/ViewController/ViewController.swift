//
//  ViewController.swift
//  RxSwift-MVVM-TableView-API-Seni
//
//  Created by 近藤米功 on 2022/08/03.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet private weak var searchTextField: UITextField!

    let musicViewModel = MusicViewModel()

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()
    }

    private func setupBindings(){
        let musicViewModelInput = MusicViewModelInput(searchTextField: searchTextField.rx.text.map{$0 ?? ""}.asObservable())
        musicViewModel.setup(input: musicViewModelInput)

        // tableViewとのバインディング
        let dataSource = DataSource()
        musicViewModel.pushMusic
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    private func setupTableView(){
        tableView.rowHeight = 200
        tableView.register(UINib(nibName: TableViewCell.nibName, bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)

        tableView.rx.itemSelected.subscribe(onNext: {[weak self] indexPath in
            guard let selectedMusic = self?.musicViewModel.fetchSelectedMusic(index: indexPath.row) else{ return }
            let viewController2 = ViewController2()
            viewController2.selectedSong = selectedMusic
            self?.navigationController?.pushViewController(viewController2, animated: true)
        })
        .disposed(by: disposeBag)
     }
}
