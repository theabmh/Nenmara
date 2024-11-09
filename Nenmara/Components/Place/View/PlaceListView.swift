//
//  PlaceListView.swift
//  Nenmara
//
//  Created by abbas m h on 09/11/24.
//

import SwiftUI
import SwiftData

struct PlaceListView: View {
    
    @Query(sort: \Place.name,animation: .easeIn) private var places : [Place]
    @ObservedObject var navigationManager: NavigationManager
    
    @State var searchableText: String = ""
    
    private var predicate: Predicate<Place> {
        #Predicate<Place> {
            if searchableText.isEmpty == false {
               $0.name.localizedStandardContains(searchableText)
            }else{
                true
            }
        }
    }
    
    init(navigationManager: NavigationManager) {
        self.navigationManager = navigationManager
    }
    
    var body: some View {
        NavigationStack(path: $navigationManager.routes) {
            
            VStack(alignment: .center, spacing: 16){
                ScrollView(.vertical) {
                    LazyVStack(alignment: .center, spacing: 16) {
                        ForEach(places) { place in
                            PlaceCellView(place: place)
                                .onTapGesture {
                                    navigationManager.push(to: .placeDetails(place: place))
                                }
                        }
                        withAnimation {
                            ForEach((try? places.filter(predicate)) ?? places) { place in
                                PlaceCellView(place: place)
                                    .scrollTransition { content, phase in
                                        content
                                            .scaleEffect(phase.isIdentity ?  1 : 0.8)
                                    }
                            }
                        }
                        ForEach(places) { place in
                            PlaceCellView(place: place)
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ?  1 : 0.8)
                                }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationDestination(for: Route.self) { $0 }
            .searchable(text: $searchableText)
        }
    }
}

#Preview {
    PlaceListView(navigationManager: NavigationManager())
        .modelContainer(Place.previewContainer!)
}
