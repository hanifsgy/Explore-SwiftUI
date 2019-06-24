//
//  Map.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 24/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//
import MapKit
import SwiftUI

struct Map : UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 33.383293, longitude: -118.433304)
        let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

#if DEBUG
struct Map_Previews : PreviewProvider {
    static var previews: some View {
        Map()
    }
}
#endif
