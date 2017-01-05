//
//  AAA.swift
//  animation
//
//  Created by zeroplus on 2016/12/8.
//  Copyright © 2016年 zeroplus. All rights reserved.
//

import UIKit

class AAA: UIView {

    struct Constant {
        //進度條寬度
        static let lineWidth: CGFloat = 10
        //進度槽顏色
        static let trackColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0,
                                        alpha: 1)
        //進度條顏色
        static let progressColoar = UIColor.orange
    }
    
    //進度槽
    let trackLayer = CAShapeLayer()
    //進度條
    let progressLayer = CAShapeLayer()
    //進度條路徑（整個圆圈）
    let path = UIBezierPath()
    
    //目前進度
    @IBInspectable var progress: Int = 0 {
        didSet {
            if progress > 100 {
                progress = 100
            }else if progress < 0 {
                progress = 0
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        //取得整個進度條路徑(圓圈)
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                              radius: bounds.size.width/2 - Constant.lineWidth,
                              startAngle: angleToRadian(angle: -90), endAngle: angleToRadian(angle: 270), clockwise: true)
        
        //繪製進度槽
        trackLayer.frame = bounds
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = Constant.trackColor.cgColor
        trackLayer.lineWidth = Constant.lineWidth
        trackLayer.path = path.cgPath
        layer.addSublayer(trackLayer)
        
        //繪製進度條
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = Constant.progressColoar.cgColor
        progressLayer.lineWidth = Constant.lineWidth
        progressLayer.path = path.cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = CGFloat(progress)/100.0
        layer.addSublayer(progressLayer)
    }
    
    //設置進度（可以設製是否播放動畫）
    func setProgress(pro: Int,animated anim: Bool) {
        setProgress(pro: pro, animated: anim, withDuration: 0.55)
    }
    
    //設置進度（可以設製是否播放動畫，以及動畫時間）
    func setProgress(pro: Int,animated anim: Bool, withDuration duration: Double) {
        progress = pro
        //進度條動畫
        CATransaction.begin()
        CATransaction.setDisableActions(!anim)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setAnimationDuration(duration)
        progressLayer.strokeEnd = CGFloat(progress)/100.0
        CATransaction.commit()
    }
    
    //將角度轉為弧度
    private func angleToRadian(angle: Double)->CGFloat {
        return CGFloat(angle/Double(180.0) * M_PI)
    }
}
