//
//  SWRevealTableViewController.swift
//  testTableViewSegue
//
//  Created by Dovran on 14.08.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit

class SWRevealTableViewController: UITableViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var recepts = ["Домой","Рецепты Джейми Оливера","Instagram","VK","Местоположение","О нас"]
    var receptsImages = ["home","JamieOliver","InstagramIcon","vkIcon","locationIcon","MelnourneInfo"]
    
    var revealIndentifier = ["Home","One","Two","Three","Four","Five"]
    
    lazy var weatherManager = APIWeatherManager(apiKey: "2a6d8e376a69c1ae07d4a52dd0c2dfdc")
    let coordinates = Coordinates(latitude: 37.95, longitude: 58.38333)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Вызываем функцию
        getCurrentWeatherData()
        
        //Устанавливаем RefreshControl чтобы обновлялось страница
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = .white
        refreshControl?.tintColor = UIColor.black
        refreshControl?.addTarget(self, action: #selector(getCurrentWeatherData), for: .valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recepts.count
    }
    
    //Weather
    func updateUIWith(currentWeather : CurrentWeather) {
        self.weatherImage.image = currentWeather.icon
        //        self.pressureLabel.text = currentWeather.pressureString
        self.temperatureLabel.text = currentWeather.temperatureString
        //        self.appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
        //        self.humidityLabel.text = currentWeather.humidityString
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: revealIndentifier[indexPath.row], for: indexPath) as! RevealTableViewCell
        cell.info.text = recepts[indexPath.row]
        cell.revealImages.image = UIImage (named:receptsImages[indexPath.row])

        
        return cell
    }
    
    //ActivityIndicator
    func getCurrentWeatherData() {
        
        //Weather
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            switch result {
            case .Success(let currentWeather):
                self.updateUIWith(currentWeather: currentWeather)
            case .Failure(let error as NSError):
                
                let alertController = UIAlertController(title: "Unable to get data ", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                self.present(alertController,animated: true, completion: nil)
            default: break
                
            }
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    
}
