//
//  Workout.swift
//  Workout
//
//  Created by blind heitz nathan on 03/03/2022.
//

import SwiftUI
import MapKit

enum Category: String, CaseIterable {
    case bike, running, walking
    
    var icon: String {
        switch self {
        case .bike:
            return "bicycle"
        case .running:
            return "hare"
        case .walking:
            return "figure.walk"
        }
    }
}

struct MapLocation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct Workout: Identifiable {
    var id = UUID()
    var categogy: Category
    var date: Date
    var points: [MapLocation]
    
    static var testData = [
        Workout(categogy: .bike, date: Date(), points: [MapLocation(coordinate: CLLocationCoordinate2D(latitude: 20, longitude: 20)), MapLocation(coordinate: CLLocationCoordinate2D(latitude: 25, longitude: 25))]),
        Workout(categogy: .walking, date: Date(), points: [MapLocation(coordinate: CLLocationCoordinate2D(latitude: 15, longitude: 18)), MapLocation(coordinate: CLLocationCoordinate2D(latitude: 6, longitude: 5))]),
        Workout(categogy: .running, date: Date(), points: [MapLocation(coordinate: CLLocationCoordinate2D(latitude: 10, longitude: 7)), MapLocation(coordinate: CLLocationCoordinate2D(latitude: 4, longitude: 4))])
    ]
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
}
