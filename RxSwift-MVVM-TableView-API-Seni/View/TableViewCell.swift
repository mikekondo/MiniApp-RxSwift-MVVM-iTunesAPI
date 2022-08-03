//
//  TableViewCell.swift
//  RxSwift-MVVM-TableView-API-Seni
//
//  Created by 近藤米功 on 2022/08/03.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var musicNameLabel: UILabel!

    static var identifier = "custumCell"
    static var nibName = "TableViewCell"


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
