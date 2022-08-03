//
//  DataSource.swift
//  RxSwift-MVVM-TableView-API-Seni
//
//  Created by 近藤米功 on 2022/08/03.
//

import RxSwift
import RxCocoa
import SDWebImage
import UIKit

final class DataSource: NSObject, UITableViewDataSource,RxTableViewDataSourceType{

    typealias Element = [Song]
    var songs: [Song] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let element = songs[indexPath.row]
        cell.artistNameLabel.text = element.artistName
        cell.musicNameLabel.text = element.trackName
        cell.artImageView.sd_setImage(with: URL(string: element.artworkUrl100))
        return cell
    }

    func tableView(_ tableView: UITableView, observedEvent: Event<[Song]>) {
        Binder(self){ dataSource, element in
            dataSource.songs = element
            tableView.reloadData()
        }
        .on(observedEvent)
    }
}
