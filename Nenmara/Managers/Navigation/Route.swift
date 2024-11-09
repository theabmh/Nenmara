//
//  Route.swift
//  Nenmara
//
//  Created by abbas m h on 09/11/24.
//

import SwiftUI

enum Route: Identifiable,Hashable {
        
    case home
    case placeDetails(place: Place)
    
    var id: String {
        switch self {
        case .home: return "home"
        case .placeDetails(place: let place): return "placeDetails(\(place.name))"
        }
    }
}

extension Route: View {
    var body: some View {
        switch self {
        case .home:
            EmptyView()
        case .placeDetails(let place):
            @Namespace var nameSpace
            PlaceDetailView(place: place)
                .navigationTransition(.zoom(sourceID: 1, in: nameSpace))
                
        }
    }
}
