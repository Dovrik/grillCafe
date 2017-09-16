//
//  CollectionViewController.swift
//  testTableViewSegue
//
//  Created by Dovran on 30.07.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    
    var tableName = [String]()
    var tableGram = [String]()
    var tableType = [String]()
    var tablePrice = [String]()
    var tableImage = [String]()
    
    var name : AnyObject? {
        get {
            return UserDefaults.standard.object(forKey: "name") as AnyObject?
        } set {
            UserDefaults.standard.set(newValue, forKey: "name")
            UserDefaults.standard.synchronize()
        }
    }
    var gram : AnyObject? {
        
        get {
            return UserDefaults.standard.object(forKey: "gram") as AnyObject?
        } set {
            UserDefaults.standard.set(newValue, forKey: "gram")
            UserDefaults.standard.synchronize()
        }
    }
    var type : AnyObject? {
        
        get {
            return UserDefaults.standard.object(forKey: "type") as AnyObject?
        } set {
            UserDefaults.standard.set(newValue, forKey: "type")
            UserDefaults.standard.synchronize()
        }
    }
    var price : AnyObject? {
        
        get {
            return UserDefaults.standard.object(forKey: "price") as AnyObject?
        } set {
            UserDefaults.standard.set(newValue, forKey: "price")
            UserDefaults.standard.synchronize()
        }
    }
    var image : AnyObject? {
        
        get {
            return UserDefaults.standard.object(forKey: "image") as AnyObject?
        } set {
            UserDefaults.standard.set(newValue, forKey: "image")
            UserDefaults.standard.synchronize()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem (title: "", style: .plain, target: nil, action: nil)

    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tableName.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        cell.collectionName.text = tableName[indexPath.row]
        //   cell.collectionType.text = tableGram[indexPath.row]
        cell.collectionPrice.text = tablePrice[indexPath.row]
        cell.collectionImage.image = UIImage(named: tableImage[indexPath.row])
        
        // Режем углы у View
        cell.viewCollection.layer.cornerRadius = 10
        cell.viewCollection.layer.masksToBounds = true
        
        //Режем углы у image
        cell.collectionImage.layer.cornerRadius = 12
        cell.collectionImage.layer.masksToBounds = true
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        name = tableName [indexPath.row] as AnyObject?
        image = tableImage [indexPath.row] as AnyObject?
        price = tablePrice[indexPath.row] as AnyObject?
    }

    
    
}
