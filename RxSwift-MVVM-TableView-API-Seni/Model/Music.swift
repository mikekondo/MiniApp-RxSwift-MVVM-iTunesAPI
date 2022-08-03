//
//  Music.swift
//  RxSwift-MVVM-TableView-API-Seni
//
//  Created by 近藤米功 on 2022/08/03.
//

import Foundation
import PKHUD

struct Songs: Codable{
    let results: [Song] 
}

struct Song: Codable{
    let artistName: String
    let trackName: String
    let artworkUrl100: String
}

class Music{

    func fetchSong(url: URL,completion: @escaping([Song]) -> Void){
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }

            guard let data = data, let response = response as? HTTPURLResponse else {
                print("data or response is nil")
                return
            }
            do{
                let songs = try JSONDecoder().decode(Songs.self, from: data)
                completion(songs.results)
            }catch(let error){
                print("情報の取得に失敗しました",error)
            }
        }
        task.resume()
    }

}

