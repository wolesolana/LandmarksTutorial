//
//  Landmark.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
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
}
