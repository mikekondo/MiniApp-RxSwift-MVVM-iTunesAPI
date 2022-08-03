//
//  MusicViewModel.swift
//  RxSwift-MVVM-TableView-API-Seni
//
//  Created by 近藤米功 on 2022/08/03.
//

import Foundation
import RxSwift
import RxCocoa
import PKHUD

struct MusicViewModelInput{
    var searchTextField: Observable<String>
}

final class MusicViewModel{

    let disposeBag = DisposeBag()
    // API回す
    private var music = Music()

    var pushMusic = BehaviorRelay<[Song]>(value: [])

    var song: [Song] = []

    // あとで消す
    var url = URL(string: "https://itunes.apple.com/search?term=oneokrock&entity=song&contry=jp")!

    func setup(input: MusicViewModelInput){
        input.searchTextField.subscribe(onNext: {[weak self] text in
            guard let searchURL =  URL(string: "https://itunes.apple.com/search?term=\(text)&entity=song&contry=jp") else {
                return
            }
            self?.music.fetchSong(url: searchURL) { song in
                self?.song = song
                self?.pushMusic.accept(song)
            }
        })
        .disposed(by: disposeBag)
    }

    func fetchSelectedMusic(index: Int) -> Song{
        return song[index]
    }
    
}
