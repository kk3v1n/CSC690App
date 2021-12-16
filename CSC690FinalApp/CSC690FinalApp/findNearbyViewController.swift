//sources: (also posted on github readme)
//https://youtu.be/Hn_MGvuYZdg - Adding Custom Pins to Map (Lets Code With Jack Hoskins)
//https://youtu.be/y3UjZ8S_Eu4 - Show User's Location on Map (Lets Code With Jack Hoskins)
//https://youtu.be/DHpL8yz6ot0 - Swift: Custom Map Pin Annotations (iOS Academy)

import UIKit
import MapKit
import CoreLocation

struct commonPins{
    var title: String
    var coordinate: CLLocationCoordinate2D
}

class findNearbyViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    //coordinates of McEnery convention center
    //37.3292° N, -121.8890° W

    let appleHQ = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization() //ask user for thier location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // get the best location
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        mapView.setRegion(MKCoordinateRegion(center: appleHQ, span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9)), animated: false) //zoom in
        
        mapView.delegate = self
        
        addNewPin()
        addNewPin1()
        
    }
    
    func addNewPin(){
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 37.3292, longitude: -121.8890)
        point.title = "Wicked TicTacToe"
        point.subtitle = "San Jose McEnery Convention Center"
        mapView.addAnnotation(point)
    }
    
    func addNewPin1(){
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 37.4042, longitude: -121.9755)
        point.title = "Classic Chess"
        point.subtitle = "Santa Clara Convention Center"
        mapView.addAnnotation(point)
    }
    
    //due to time constraints from other classes, if i had more time, i would added a feature that would allow people to enter a location in which a pin could be added, so i didn't have to do hard coding
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else{ // we dont want to use the user location
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "getRid")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "getRid")
            annotationView?.canShowCallout = true
        }
        else{
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "pin") //change the image of the pin
        
        return annotationView
    }
    
}
