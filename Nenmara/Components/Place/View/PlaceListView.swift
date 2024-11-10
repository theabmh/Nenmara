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
    @Environment(\.router) private var navigationManager
    
    @State var searchableText: String = ""
    @Namespace var namespace
    
    private var predicate: Predicate<Place> {
        #Predicate<Place> {
            if searchableText.isEmpty == false {
               $0.name.localizedStandardContains(searchableText)
            }else{
                true
            }
        }
    }
    

    var body: some View {
            VStack(alignment: .center, spacing: 16){
                ScrollView(.vertical) {
                    LazyVStack(alignment: .center, spacing: 16) {
                        ForEach(Place.previewPlaces) { place in
                            PlaceCellView(place: place)
                                .onTapGesture {
                                    navigationManager?.push(to: .placeDetails(place: place,namespace: namespace))
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
            .searchable(text: $searchableText)
            .navigationTitle("Places")
    }
}

#Preview {
    @Previewable @StateObject var navigationManager: NavigationManager = .init()
    NavigationStack(path: $navigationManager.routes) {
        PlaceListView()
            .navigationDestination(for: Route.self, destination: { $0 })
            .modelContainer(Place.previewContainer!)
    }
    
}
