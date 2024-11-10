//
//  PlaceChart.swift
//  Nenmara
//
//  Created by abbas m h on 10/11/24.
//

import Foundation
struct PlaceChart{
    let name: String
    let rating: Double
    
    static let previewRatings: [PlaceChart] = [
        .init(name: "Place 1", rating: 4.5),
        .init(name: "Place 2", rating: 3.5),
        .init(name: "Place 3", rating: 2.5),
        .init(name: "Place 4", rating: 1.5),
    ]
}
