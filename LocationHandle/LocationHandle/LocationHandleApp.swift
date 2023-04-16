//
//  LocationHandleApp.swift
//  LocationHandle
//
//  Created by Arun Skyraan on 19/03/23.
//

import SwiftUI

@main
struct LocationHandleApp: App {
    
    @StateObject private var lvm = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(lvm)
        }
    }
}
