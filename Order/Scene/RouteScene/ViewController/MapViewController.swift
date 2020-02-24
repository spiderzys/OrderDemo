//
//  MapViewController.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, RouteSceneVC, ViewModelBinded {
    var viewModel: MapViewModel?
    
    @IBOutlet var mapView: MKMapView!
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
        mapView.showRouteOnMap(path:viewModel?.path ?? RoutePath.mock )
    }
    
    
    
    
    @IBAction func clear(_ sender: Any) {
        searchBar.text = ""
    }
    

}

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text  else {return}
        searchBar.endEditing(true)
        search(text: text)
    }
    
    func search(text:String) {
        
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
    
        return renderer
    }
}
