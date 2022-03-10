//
//  WorkoutDetailsView.swift
//  Workout
//
//  Created by blind heitz nathan on 03/03/2022.
//

import SwiftUI
import MapKit

struct WorkoutDetailsView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    var workout: Workout
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: workout.categogy.icon)
                Text(workout.getFormattedDate())
            }
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: workout.points, annotationContent: { location in
                MapMarker(coordinate: location.coordinate, tint: .red)
            })
                .onAppear {
                    viewModel.checkIfLocationServiceIsEnabled()
                }
                .accentColor(.orange)
            Spacer()
        }
        .navigationTitle("Details")
    }
}

struct WorkoutDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailsView(workout: Workout.testData[0])
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25, longitude: 80), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("show alert")
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("location restricted")
            case .denied:
                print("location denied")
            case .authorizedAlways, .authorizedWhenInUse:
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            @unknown default:
                break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
