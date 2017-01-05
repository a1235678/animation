//
//  ViewController.swift
//  animation
//
//  Created by zeroplus on 2016/12/8.
//  Copyright © 2016年 zeroplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cuteImageView: UIImageView!
    @IBOutlet weak var stopView: UIImageView!
    @IBOutlet weak var blackView: UIImageView!
    
    var x = 0
    
    // 3
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 3
        for i in 1...3 {
            imageArray.append(UIImage(named:"\(i)")!) }
        self.cuteImageView.animationImages = imageArray
        self.cuteImageView.animationDuration = 1
        self.cuteImageView.animationRepeatCount = 0

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 1. stop the animate
    //當符合條件時，停止動畫
    @IBAction func invalidate(_ sender: Any) {
        self.stopView.frame = CGRect(x: 30, y: 30, width: 20, height: 20)
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats:
            true, block: {(timer) -> Void in
                self.stopView.frame =
                    self.stopView.frame.offsetBy(dx: 1, dy: 1)
                if self.stopView.frame.origin.x > 130 {
                    timer.invalidate()
                } })
    }
    
    // 2. delay, then move
    //設定Delay的秒數 及 完成動畫時的動作
    @IBAction func delayNmove(_ sender: UIButton) {
        let greenView = UIImageView(frame: CGRect(x: 30, y: 30, width: 20, height: 20))
        greenView.backgroundColor = UIColor.green
        sender.superview?.addSubview(greenView)
        
        UIView.animate(withDuration: 3, delay: 3, options:
            [.curveEaseOut] , animations: {
                greenView.frame = CGRect(x: 126, y: 149,
                                              width: greenView.frame.size.width * 2, height:
                    greenView.frame.size.height * 2)
        }, completion: { result -> Void in
            greenView.removeFromSuperview()
        })
    }
    
    // 3. images
    @IBAction func images(_ sender: UIButton) {
        if self.cuteImageView.isAnimating == true{
            
            self.cuteImageView.stopAnimating()
            sender.setTitle("PLAY", for: .normal)
            
            self.cuteImageView.image = UIImage(named: "\(arc4random_uniform(2)+1)")
        }else{
            // 3
            self.cuteImageView.startAnimating()
            
            sender.setTitle("STOP", for: .normal)
        }
    }
    
    // 4. loading
    @IBAction func goButton(_ sender: Any) {
        x = 0
        
        let view = self.circleView as! AAA

        Timer.scheduledTimer(withTimeInterval: 0.01, repeats:
            true, block: {(timer) -> Void in
                view.setProgress(pro: self.x, animated: false)
                self.x += 1
                if self.x > 100 {
                    timer.invalidate()
                } })
    }
    
    // 5. color's change
    @IBAction func colorAnimation(_ sender: Any) {
        if imageView.backgroundColor == UIColor.red{
            UIView.animate(withDuration: 5) {
                self.imageView.backgroundColor = UIColor.blue
            }
        }else{
            UIView.animate(withDuration: 5) {
                self.imageView.backgroundColor = UIColor.red
            }
        }
    }
    
    // 6. frame & alpha animation
    @IBAction func ani(_ sender: UIButton) {

        self.blackView.frame = CGRect(x: 30, y: 30, width: 60, height: 60)
        self.blackView.alpha = 1
        
        UIView.animate(withDuration: 5){
            self.blackView.frame = CGRect(x: 120, y: 120, width: 20, height: 20)
            self.blackView.alpha = 0.1
        }
    }
    
}

