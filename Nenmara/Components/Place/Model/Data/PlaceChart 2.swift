//
//  PlaceChart.swift
//  Nenmara
//
//  Created by abbas m h on 10/11/24.
//

import Foundation
struct TripChart{
    let name: String
    let rating: Double
    
    static let previewRatings: [TripChart] = [
        .init(name: "Trip 1", rating: 2.5),
        .init(name: "Trip 2", rating: 3.5),
        .init(name: "Trip 3", rating: 4.0),
        .init(name: "Trip 4", rating: 4.7),
    ]
}
