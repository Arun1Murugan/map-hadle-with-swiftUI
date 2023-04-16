//
//  LocationsViewModel.swift
//  LocationHandle
//
//  Created by Arun Skyraan on 19/03/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    //all loaded location
    @Published var locations: [Location]
    //current location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
   //current region
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
//            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
// explain
//        let currentIndex = locations.firstIndex { location in
//
//            return location == mapLocation
//
//        }
        
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else { return }
        
        let next = currentIndex + 1
        
        guard  locations.indices.contains(next) else {
            guard let first = locations.first else { return }
            showNextLocation(location: first)
            return
        }
        
        let nextlocation = locations[next]
        showNextLocation(location: nextlocation)
    }
    
    
}
