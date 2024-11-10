//
//  PlaceRatingChart.swift
//  Nenmara
//
//  Created by abbas m h on 10/11/24.
//

import SwiftUI
import Charts

struct PlaceRatingChartView: View {
    var body: some View {
        VStack{
            Chart(PlaceChart.previewRatings ,id: \.name) { rating in
                SectorMark(angle: .value("Rating",rating.rating),innerRadius: .ratio(0.4),angularInset: 1)
                    .cornerRadius(7)
                    .foregroundStyle(by: .value("Place", rating.rating))
            }
            .padding(16)
            Chart(TripChart.previewRatings,id: \.name){ review in
                BarMark(x: .value("Trip", review.name), y: .value("Rating", review.rating))
            }
            .padding(16)
            HStack{
                Chart(TripChart.previewRatings,id: \.name){ review in
                    LineMark(x: .value("Trip",review.name),y: .value("Rating",review.rating))
                }
                .padding(8)
                
                Chart(TripChart.previewRatings,id: \.name){ review in
                    PointMark(x: .value("Trip", review.name), y: .value("Rating", review.rating))
                }
                .padding(8)
                
            }
            .padding(16)
        }
        .navigationTitle("Charts")
    }
}

#Preview {
    PlaceRatingChartView()
}
