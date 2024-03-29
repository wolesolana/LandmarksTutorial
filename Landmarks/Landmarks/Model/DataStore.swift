//
//  ModelData.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import Foundation

@Observable
class DataStore {
    var landmarks: [Landmark] = loadData(from: "landmarkData.json")
    var hikes: [Hike] = loadData(from: "hikeData.json")
    var profile = Profile.default

    var categories: [String : [Landmark]] {
        Dictionary(grouping: landmarks,
                   by: { $0.category.rawValue }
        )
    }
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}


func loadData<T: Decodable>(from filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
