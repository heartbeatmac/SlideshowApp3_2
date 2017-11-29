//
//  ResultViewController.swift
//  SlideshowApp3
//
//  Created by 永島利章 on 2017/11/28.
//  Copyright © 2017年 toshiaki.nagashima2. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var photoName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named:photoName)
        
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
