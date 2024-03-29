//
//  Landmark.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    var featureImage: Image? {
        isFeatured ? Image("\(imageName)_feature") : nil
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    struct Coordinates: Codable, Hashable {
        var longitude: Double
        var latitude: Double
    }

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
