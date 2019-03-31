//
//  MainViewControl.swift
//  GuessPrice
//
//  Created by 方瑾 on 2019/1/17.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class MainViewControl: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var goodImageView: UIImageView!
    
    @IBOutlet weak var bigTextFied: UITextField!
    
    @IBOutlet weak var guessButton: UIButton!
    
    @IBOutlet weak var oneAgainButton: UIButton!
    var result = Int()
    var price = Int()
    var imageName = ["苹果","西瓜","草莓","野草莓","油桃"]
    var fakeNum = 0
    var wakeNume = 100
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //arc4random_uniform随机出价
        oneAgainButton.addTarget(self, action: #selector(restart), for: .touchUpInside)
        guessButton.addTarget(self, action: #selector(guess), for: .touchUpInside)
        result = Int(arc4random_uniform(100)) + 1
        
//        bigTextFied.text = "\(randomNum)"
        let xiaNum = Int(arc4random_uniform(5))
        goodImageView.image = UIImage(named: imageName[xiaNum])
        

    }
    
    @objc func restart(_ sender: UIButton) {
        textLabel.text = "请出价"
        result = Int(arc4random_uniform(100)) + 1
        let xiaNum = Int(arc4random_uniform(5))
        goodImageView.image = UIImage(named: imageName[xiaNum])
    }

    @objc func guess (_ sender:UIButton) {
        let text = bigTextFied.text!
        price = Int(text) ?? 0
        if price > result {
            if price < wakeNume {
             wakeNume = price
            }
            textLabel.text = "价钱太高了\n请在\(fakeNum)-\(wakeNume)出价"
        } else if price < result {
            if price > fakeNum {
            fakeNum = price
            }
            textLabel.text = "价钱太低了\n请在\(fakeNum)-\(wakeNume)出价"                         //50
        } else if price == result {
            textLabel.text = "成交"
    
    }
    bigTextFied.text = ""
}
    

    

}
