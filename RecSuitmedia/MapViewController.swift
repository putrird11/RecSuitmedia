//
//  MapViewController.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 07/06/22.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle: String, pinSubtitle: String, location: CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubtitle
        self.coordinate = location
    }
}

class MapViewController: UIViewController, MKMapViewDelegate, UIViewControllerTransitioningDelegate{
    
    func onButtonTapped() {
        let nextViewController = ListUser()
        
        navigationController?.pushViewController(nextViewController,
                                                 animated: false)
    }
    
    @IBOutlet weak var mapView: MKMapView!
    let customView = OverlayView()
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "poin")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        showMiracle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        
        //New York
        let location = CLLocationCoordinate2D(latitude: 40.741895, longitude: -73.989308)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
        let pin = customPin(pinTitle: "New york, New York", pinSubtitle: "United States of America", location: location)
        self.mapView.addAnnotation(pin)
        self.mapView.delegate = self
        
        //
        let location2 = CLLocationCoordinate2D(latitude: 40.8043051933537, longitude: -73.99334456241783)
        let region2 = MKCoordinateRegion(center: location2, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region2, animated: true)
        let pin2 = customPin(pinTitle: "8901 River Road, North Bergen, NJ 07047", pinSubtitle: "United States of America", location: location2)
        self.mapView.addAnnotation(pin2)
        self.mapView.delegate = self
        //MARK: Modify Navigation bar
        
        //Delete text back
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Change Colour
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.17, green: 0.39, blue: 0.48, alpha: 1.00)]
        
        
        
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        navigationController?.navigationBar.tintColor = UIColor(red: 0.17, green: 0.39, blue: 0.48, alpha: 1.00)
        
        configureItems()
    }
    
    @objc func showMiracle() {
        let slideVC = OverlayView()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        present(slideVC, animated: true, completion: nil)
    }
    
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presentingViewController)
    }
    
    
    private func configureItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "list"),
            style: .plain,
            target: self,
            action: #selector(back)
        )
    }
    
    
    @objc func back() {
        performSegue(withIdentifier: "bck", sender: nil)
    }
}
