//
//  ViewController2.swift
//  RxSwift-MVVM-TableView-API-Seni
//
//  Created by 近藤米功 on 2022/08/03.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class ViewController2: UIViewController {

    var selectedSong = Song(artistName: "", trackName: "", artworkUrl100: "")

    @IBOutlet private weak var artImageView: UIImageView!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var trackNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        artistNameLabel.text = selectedSong.artistName
        trackNameLabel.text = selectedSong.trackName
        artImageView.sd_setImage(with: URL(string: selectedSong.artworkUrl100))
    }

}
