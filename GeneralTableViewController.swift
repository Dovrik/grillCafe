//
//  GeneralTableViewController.swift
//  testTableViewSegue
//
//  Created by Dovran on 14.08.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit
import MapKit

class GeneralTableViewController: UITableViewController, MKMapViewDelegate {
    
    @IBOutlet weak var Open: UIBarButtonItem!
    @IBAction func call(_ sender: Any) {
        callNumber(phoneNumber: foodPhoneNumber)
    }
    
    @IBOutlet weak var mapView: MKMapView!


    
    var foodPhoneNumber = "+99364347350"
    var general = [menyuStruct]()
    var all = [CollectionFoodTwo]()
    var identifierVC = ["Cell","KinderCell"]
    
    
    //Функция для звонка
    func callNumber (phoneNumber: String) {
        if let url = URL(string: "tel://\(phoneNumber)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    print(success)
                })
            } else {
                let success = UIApplication.shared.openURL(url)
                print(success)
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general = [menyuStruct(menyu: "Главное меню",image: "Бургеры"),
                   menyuStruct(menyu: "Детское меню",image: "Мясо")]
        
        //MapViewController
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(foodLocation) { (placemarks, error) in
            
            guard error == nil else { return }
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first!
            
            let annotation  = MKPointAnnotation()
            annotation.title = self.foodName
            
            guard let location = placemark.location else { return }
            annotation.coordinate = location.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation,animated: true)
        }
        
        //SWRevealViewController
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // убрать название «Мои рестораны из кнопки назад»
        self.navigationItem.backBarButtonItem = UIBarButtonItem (title: "", style: .plain, target: nil, action: nil)
        

    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return general.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierVC[indexPath.row], for: indexPath) as! GeneralTableViewCell
        
        cell.nameLabel.text = general[indexPath.row].menyu
        cell.generalImage.image = UIImage(named: general[indexPath.row].image)
        
        cell.visualEffect.layer.cornerRadius = 60
        cell.visualEffect.layer.masksToBounds = true
        
        return cell
    }
    
    //MapViewController
    var foodLocation = "Туркменистан, Ашхабад, Exit to Abadancylyk Frontage Road"
    var foodName = "Melbourne Gril Cafe"
    var mapRightImage = "ApplCon 60x60"
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil}
        
        let annatationIdentifier = "restAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annatationIdentifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annatationIdentifier)
            annotationView?.canShowCallout = true
        }
        
        let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        rightImage.image = UIImage(named: mapRightImage)
        annotationView?.rightCalloutAccessoryView = rightImage
        
        annotationView?.pinTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return annotationView
    }
    
    
    
}
