//
//  NenmaraApp.swift
//  Nenmara
//
//  Created by abbas m h on 09/11/24.
//

import SwiftUI
import SwiftData

@main
struct NenmaraApp: App {
    
    @StateObject private var router: NavigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            PlaceListView(navigationManager: router)
        }
        .modelContainer(for: Place.self)
    }
}
