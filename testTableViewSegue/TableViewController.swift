//
//  TTableViewController.swift
//  testTableViewSegue
//
//  Created by Dovran on 30.07.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TableViewController: UITableViewController, CLLocationManagerDelegate {
    
    
    //Weather
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    
    let locationManager = CLLocationManager()
 
        //ActivityIndicator
    //   @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var all = [menyuStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        all = [menyuStruct(menyu : "Супы", image : "Суп"),
               menyuStruct(menyu : "Холодные закуски", image : "Холодные_закуски"),
               menyuStruct (menyu : "Горячие закуски", image : "Горячие_закуски"),
               menyuStruct(menyu : "Салаты", image : "Салаты"),
               menyuStruct(menyu : "Бургеры", image : "Бургеры"),
               menyuStruct (menyu : "Паста", image : "Паста"),
               menyuStruct(menyu : "Пиццы", image : "Пицца"),
               menyuStruct(menyu : "Мясо", image : "Мясо"),
               menyuStruct (menyu : "Стейки", image : "Стейк"),
               menyuStruct(menyu : "Курицы", image : "Курица"),
               menyuStruct(menyu : "Рыбы", image : "Рыба"),
               menyuStruct (menyu : "Гарниры", image : "Гарнир"),
               menyuStruct (menyu : "Десерты", image : "Десерт")]
        
        // убираем строки под ячейками, под ячейками будет чистый лист, прописывается в методе
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // меняем цвет полосы, прописывается в методе ViewDidLoad
        tableView.separatorColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        // убрать название «Мои рестораны из кнопки назад»
        self.navigationItem.backBarButtonItem = UIBarButtonItem (title: "", style: .plain, target: nil, action: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Убрать выделение ячейки
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return all.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        cell.generalLabel.text = all[indexPath.row].menyu
        cell.generalImage.image = UIImage(named: all[indexPath.row].image)
        cell.generalImage.layer.borderWidth = 2
        cell.generalImage.layer.borderColor = UIColor.white.cgColor
        
        cell.generalLabel.layer.cornerRadius = 60
        cell.generalLabel.layer.masksToBounds = true
        //        cell.generalLabel.layer.borderWidth = 1
        //        cell.generalLabel.layer.borderColor = UIColor.white.cgColor
        
        cell.visualEffectView.layer.cornerRadius = 60
        cell.visualEffectView.layer.masksToBounds = true
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAll" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! CollectionViewController
                
                var dvcCollectionView : CollectionFood
                dvcCollectionView = self.food[indexPath.row]
                dvc.tableName = dvcCollectionView.name
                dvc.tableType = dvcCollectionView.type
                dvc.tablePrice = dvcCollectionView.price
                dvc.tableImage = dvcCollectionView.image
                //      dvc.tableGram = dvcCollectionView.gram
                
            }
        }
        if segue.identifier == "searchSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! SearchTableViewController
                
                var dvcSearch : CollectionFood
                dvcSearch = self.food[indexPath.row]
                dvc.searchName = dvcSearch.name
                dvc.SearchPrice = dvcSearch.price
                dvc.SearchImage = dvcSearch.image
            }
        }
    }
    

    
   
    private func locationManager(_ manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
        let userLocation = locations.last! as CLLocation
        print("my locations latitude: \(userLocation.coordinate.latitude), longitude: \(userLocation.coordinate.longitude)")
    }
    
    
    //Супы
    var food = [CollectionFood(name: ["Куриный суп","Томатный суп","Мексиканский суп","Минестроне овощной","Том ям","Тыквенный суп с сыром Фета и фисташками", "Чечевичный острый по-Мороканский", "Крем суп-грибной"],
                               gram: [""],
                               type: [""],
                               price: ["12 ман","12 ман","16 ман","12 ман","50 ман","20 ман","25 ман","17 ман"],
                               image: ["Суп","Суп","Суп","Суп","Суп","Суп","Суп","Суп"]),
                //Холодные закуски
        CollectionFood(name: ["Брускетта с песто и пармезаном","Брускетта класическая","Карпачо из сёмги","Багет с сёмгой","Сырное ассорти","Закуска на чипсах с тунцом"],
                       gram: [""],
                       type: [""],
                       price: ["15 ман","10 ман","45 ман","40 ман","70 ман","19 ман"],
                       image: ["Холодные_закуски","Холодные_закуски","Холодные_закуски","Холодные_закуски","Холодные_закуски","Холодные_закуски"]),
        //Горячие закуски
        CollectionFood(name: ["Рёсти с сёмгой","Блинчики с мясом","Блинчики с курицей","Закуска 'Melbourne'"],
                       gram: [""],
                       type: [""],
                       price: ["45 ман","25 ман","25 ман","65 ман"],
                       image: ["Горячие_закуски","Горячие_закуски","Горячие_закуски","Горячие_закуски"]),
        //Салаты
        CollectionFood(name: ["Цезарь с куриной грудкой","Цезарь с креветками","Салат с жаренным сыром (Халуми)","Греческий салат","Капризе","Салат мясной Де Карсе","Салат из овощей на гриле","Нисуаз","Тёплый салат с кальмарами","Салат с морепродуктами и апельсинами","Овощной с креветками","Тёплый летний салат с сёмгой","Салат 'Ля Рус'","Салат 'Виктория'"],
                       gram: [""],
                       type: [""],
                       price: ["33 ман","50 ман","32 ман","23 ман","40 ман","36 ман","27 ман","40 ман","50 ман","55 ман","37 ман","45 ман","28 ман","35 ман"],
                       image: ["Салаты","Салаты","Салаты","Салаты","Салаты","Салаты","Салаты","Салаты","Салаты","Салаты","Салаты","Салаты","Салаты","Салаты"]),
        //Бургеры премьер Мельбурн
        CollectionFood(name: ["Гамбургер 'Мельбурн'","Гамбургер","Чизбургер","Вегетарианский гамбургер","Сэндвич с куриной грудкой","Сэндвия с говяжьей вырезкой","Сэндвич с ростбифом","Мини бургеры Сет (3шт)","Мини бургеры Сет (6шт)"],
                       gram: [""],
                       type: [""],
                       price: ["32 ман","25 ман","27 ман","10 ман","23 ман","27 ман","27 ман","30 ман","42 ман"],
                       image: ["Бургеры","Бургеры","Бургеры","Бургеры","Бургеры","Бургеры","Бургеры","Бургеры","Бургеры"]),
        //Паста
        CollectionFood(name: ["Фузилли с колбасками и курицей от шеф повара","Овощное спагетти & Куриные бёдрышки с кунжутом","Лингвини с креветками от Джейми Оливера","Фузилли с лососем","Карбонара","Спагетти по вегетариански","Таглиателли с курицей и грибами в сливках","Паста 'Аль арабьята'","Паста 'Болоньезе'","Тартелонни с креветками и сёмгой"],
                       gram: [""],
                       type: [""],
                       price: ["40 ман","42 ман","60 ман","50 ман","40 ман","30 ман","40 ман","25 ман","45 ман","48 ман"],
                       image: ["Паста","Паста","Паста","Паста","Паста","Паста","Паста","Паста","Паста","Паста"]),
        //Пицца
        CollectionFood(name: ["Маргарита","Куриная","Ассорти","Пепперони","С морепродуктами","Вегетарианская","С тунцом острая с луком","Хачапури"],
                       gram: [""],
                       type: [""],
                       price: ["30 ман","35 ман","40 ман","45 ман","65 ман","35 ман","45 ман","35 ман"],
                       image: ["Пицца","Пицца","Пицца","Пицца","Пицца","Пицца","Пицца","Пицца"]),
        //Горячие блюда из мяса
        CollectionFood(name: ["Медальоны с беконом","Фахитос","Бараньи рёбрышки с соусом карри и рисом","Торнадо","Бон филе на подушке из шпината со сливками","Филе 'Миньон' с картофелем по-деревенски","Говяжий эскалоп в лимонном соусе","Микс гриль (на двоих)"],
                       gram: [""],
                       type: [""],
                       price: ["50 ман","55 ман","45 ман","60 ман","52 ман","65 ман","55 ман","150 ман"],
                       image: ["Мясо","Мясо","Мясо","Мясо","Мясо","Мясо","Мясо","Мясо"]),
        //Стейки
        CollectionFood(name: ["Rib Steak","Стейк из вырезки молодого телёнка","Нежная вырезка обжаренная на гриле соломкой"],
                       gram: [""],
                       type: [""],
                       price: ["62 ман","55 ман","55 ман"],
                       image: ["Стейк","Стейк","Стейк"]),
        //Горячие блюда из курицы
        CollectionFood(name: ["Цыплёнок табака с соусом ткемали","Шницель","Нежная грудка на гриле","Нежная грудка в сливочном соусе","Куриная грудка с сыром Фета","Куриная грудка с беконом и пармезаном","Курица в кисло-сладком соусе с чёрным рисом"],
                       gram: [""],
                       type: [""],
                       price: ["47 ман","40 ман","30 ман","38 ман","35 ман","57 ман","45 ман"],
                       image: ["Курица","Курица","Курица","Курица","Курица","Курица","Курица"]),
        //Горячие блюда из рыбы
        CollectionFood(name: ["Дорадо на гриле","Форель на гриле","Форель запечёная с овощами","Сёмга на гриле","Сёмга терияки","Сёмга с кускусом","Семга запечёная в духовке с овощами и винегретом","Креветки королевские на гриле","Запечёные мидии под сыром","Судак в сливочном соусе","Микс-темпура"],
                       gram: [""],
                       type: [""],
                       price: ["70 ман","70 ман","75 ман","69 ман","78 ман","75 ман","60 ман","70 ман","55 ман","45 ман","70 ман"],
                       image: ["Рыба","Рыба","Рыба","Рыба","Рыба","Рыба","Рыба","Рыба","Рыба","Рыба","Рыба"]),
        
        //Гарниры
        CollectionFood(name: ["Картофельное пюре","Картофель фри","Картофель с грибами и зеленью","Овощи на гриле","Овощи тушёные","Рис басмати","Шампиньоны"],
                       gram: [""],
                       type: [""],
                       price: ["10 ман","13 ман","11 ман","15 ман","15 ман","11 ман","12 ман"],
                       image: ["Гарнир","Гарнир","Гарнир","Гарнир","Гарнир","Гарнир","Гарнир"]),
        
        //Десерты
        CollectionFood(name: ["Морковный торт с кремом из маскарпоне","Тирамису","Чизкейк шоколадный","Чизкейк малиновый","Наполеон","Блинчик с бананом и малиновым соусом","Мороженое в ассортименте","Мороженое с фруктами","Фруктовое ассорти","Торт 'Павлова' с экзотическими фруктами"],
                       gram: [""],
                       type: [""],
                       price: ["25 ман","25 ман","25 ман","25 ман","15 ман","15 ман","20 ман","30 ман","45 ман","25 ман"],
                       image: ["Десерт","Десерт","Десерт","Десерт","Десерт","Десерт","Десерт","Десерт","Десерт","Десерт"]),]
    
    
}
