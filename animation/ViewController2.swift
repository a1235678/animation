//
//  ViewController2.swift
//  animation
//
//  Created by Apple Hsiao on 2016/12/16.
//  Copyright © 2016年 zeroplus. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var view7: UIImageView!
    @IBOutlet weak var view8: UIImageView!
    @IBOutlet weak var view9: UIImageView!
    @IBOutlet weak var view10: UIImageView!
    @IBOutlet weak var view11: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view10.layer.cornerRadius = self.view10.frame.size.width / 2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 7. auto reverse
    @IBAction func autoReverse(_ sender: Any) {
        UIView.animate(withDuration: 3, delay: 0, options:
            [.autoreverse, .repeat], animations: {
                self.view7.center.x = 120
                self.view7.center.y = 120
        }, completion: nil)
    }
    
    // 8. rotate
    @IBAction func rotate(_ sender: Any) {
        UIView.animate(withDuration: 3) {
            //M_PI = 180度
            //self.view8.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            self.self.view8.transform = self.view8.transform.rotated(by: CGFloat(M_PI))
        }
    }
    
    // 9.transform
    @IBAction func transform(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.view9.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: {result -> Void in
            UIView.animate(withDuration: 2, delay: 0, options: [], animations: {self.view9.transform = CGAffineTransform(scaleX: 1, y: 1)}, completion: nil)
            })
    }
    
    // 10. spring
    @IBAction func bounce(_ sender: Any) {
        
        //usingSpringWithDamping: 彈跳的反作用力，數值越小振動效果越明顯 0.1~1
        //initialSpringVelocity:  初始的速度，數值越大一開始移動越快
        self.view10.frame = CGRect(x: 30, y: 30, width: 95, height: 69)
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 2,
                       options: [],
                       animations: {
                        self.view10.frame = CGRect(x: 30, y:
                            90, width: self.view10.frame.size.width,height: self.view10.frame.size.height)
        }, completion: nil)
    }
    
    // 11.transition
    @IBAction func transition(_ sender: Any) {
        UIView.transition(with: self.view11, duration: 3,
                          options: UIViewAnimationOptions.transitionFlipFromLeft,
                          animations: {
                            if self.view11.image == UIImage(named: "2"){
                                self.view11.image = UIImage(named: "1")
                            }else {
                                self.view11.image = UIImage(named: "2")
                            }
        }, completion: nil)
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


