//
//  Sun.swift
//  WeatherApp
//
//  Created by Алексей on 08.02.2023.
//

import UIKit

class Sun: UIView {

    private lazy var pulse: CAGradientLayer = {
        let layer = CAGradientLayer()
        let colorCenter =  UIColor(red: 240/255.0, green: 240/255.0, blue: 80/255.0, alpha: 1.0).cgColor
        let colorTop1 =  UIColor(red: 240/255.0, green: 240/255.0, blue: 120/255.0, alpha: 0.6).cgColor
        let colorTop2 =  UIColor(red: 255/255.0, green: 250/255.0, blue: 70/255.0, alpha: 0.01).cgColor
        layer.type = .radial
        layer.colors = [ colorCenter, colorTop1, colorTop2]
        layer.locations = [ 0, 0.5, 1 ]
        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 1)
        layer.frame = self.bounds
        self.layer.insertSublayer(layer, at:0)
           return layer
       }()

       override func layoutSubviews() {
           super.layoutSubviews()
           pulse.cornerRadius = bounds.width / 2.0
       }

}
