//
//  DetailViewController.swift
//  Melbourne Cafe
//
//  Created by Dovran on 30.07.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailGram: UILabel!
    @IBOutlet weak var detailType: UILabel!
    @IBOutlet weak var detailPrice: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    @IBAction func callButton(_ sender: UIButton) {
        callNumber(phoneNumber: foodPhoneNumber)
    }
    var foodPhoneNumber = "+99364347350"
    
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
    
    var name : AnyObject? {
        get {
            return UserDefaults.standard.object(forKey: "name") as AnyObject?
        }
    }
    var gram : AnyObject? {
        get {
            return UserDefaults.standard.object(forKey: "gram") as AnyObject?
        }
    }
    var type : AnyObject? {
        get {
            return UserDefaults.standard.object(forKey: "type") as AnyObject?
        }
    }
    var price : AnyObject? {
        get {
            return UserDefaults.standard.object(forKey: "price") as AnyObject?
        }
    }
    var image : AnyObject? {
        get {
            return UserDefaults.standard.object(forKey: "image") as AnyObject?
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailName.text = name as! String?
        //        detailGram.text = gram as! String?
        //        detailType.text = type as! String?
        detailPrice.text = price as! String?
        detailImage.image = UIImage (named: image as! String)
        
//        detailImage.layer.borderWidth = 2
//        detailImage.layer.borderColor = UIColor.black.cgColor
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
