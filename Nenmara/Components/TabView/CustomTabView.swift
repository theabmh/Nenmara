//
//  CustomTabView.swift
//  Nenmara
//
//  Created by abbas m h on 10/11/24.
//

import SwiftUI

struct CustomTabView: View {
    
    @ObservedObject var navigationManager: NavigationManager
    
    init(navigationManager: NavigationManager) {
        self.navigationManager = navigationManager
    }
    
    var body: some View {
        NavigationStack(path: $navigationManager.routes) {
            TabView{
                Tab("Places",systemImage: "photo"){
                    PlaceListView()
                }
                Tab("Trip",systemImage: "chart.line.uptrend.xyaxis"){
                    PlaceRatingChartView()
                }
            }
            .navigationDestination(for: Route.self, destination: { $0 })
            .environment(\.router, navigationManager)
        }
    }
}

#Preview {
    CustomTabView(navigationManager: NavigationManager())
}
