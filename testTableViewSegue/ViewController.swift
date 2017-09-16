//
//  ViewController.swift
//  testTableViewSegue
//
//  Created by Dovran on 02.08.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menyuLabel: UILabel!
    @IBOutlet weak var childrenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menyuLabel.layer.cornerRadius = 10
        menyuLabel.layer.masksToBounds = true
        menyuLabel.layer.borderWidth = 2
        menyuLabel.layer.borderColor = UIColor.white.cgColor
        
        childrenLabel.layer.cornerRadius = 10
        childrenLabel.layer.masksToBounds = true
        childrenLabel.layer.borderWidth = 2
        childrenLabel.layer.borderColor = UIColor.white.cgColor
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
