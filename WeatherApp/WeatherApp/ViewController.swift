//
//  ViewController.swift
//  WeatherApp
//
//  Created by Алексей on 08.02.2023.
//

import UIKit

class ViewController: UIViewController {

    var sliderView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 200, green: 200, blue: 200, alpha: 0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    private var animator = UIDynamicAnimator()
    private var snapBehavior: UISnapBehavior?
    
    var sunView = Sun()
    
    var slider: UISlider = {
        var slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sliderView)
        createSliderView()
        sunView.frame = CGRect(x: -300, y: 400, width: 200, height: 200)
        view.addSubview(sunView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createConstraints()
    }

    func createAnimator(){
        animator = UIDynamicAnimator(referenceView: view)
        
    }
    
    private func transformColor(value: Float, startColor: Float, stopColor: Float) -> Float {
        guard value > 0 && value < 1  else { return 0.0 }
        let different = abs(startColor - stopColor)
        let stepColor = different / 1000
        let step = value * 1000
        if startColor > stopColor {
            let returnValue = startColor - (stepColor * step)
            return returnValue
        } else {
            let returnValue = startColor + (stepColor * step)
            return returnValue
        }
    }
    private func transformValue(value: Float, valueLow: Float, valueHigh: Float, valueLow2: Float, valueHigh2: Float) -> Float? {
        guard value >= valueLow && value <= valueHigh else { return nil }
        let different = abs(valueLow - valueHigh)
        let stepValue1 = different / 1000
        let changedValue1 = value - valueLow
        let diff1 = changedValue1/stepValue1
        
        let different2 = abs(valueLow2 - valueHigh2)
        let stepValue2 = different2 / 1000
        
        if valueLow2 > valueHigh2 {
            let returnValue = valueLow2 - (stepValue2 * diff1)
            return returnValue
        } else {
            let returnValue = valueLow2 + (stepValue2 * diff1)
            return returnValue
        }
    }
    
    func lightingDuringTheDay(time: Float) -> CAGradientLayer{
        var red1: CGFloat = 0
        var red2: CGFloat = 0
        var green1: CGFloat = 0
        var green2: CGFloat = 0
        var blue1: CGFloat = 0
        var blue2: CGFloat = 0
        
        if let value = transformValue(value: time, valueLow: 0, valueHigh: 0.25, valueLow2: 0, valueHigh2: 1) {
            red1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            red2 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            green1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            green2 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            blue1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            blue2 = CGFloat(transformColor(value: value, startColor: 130.0, stopColor: 200.0))
        }
        if let value = transformValue(value: time, valueLow: 0.25, valueHigh: 0.35, valueLow2: 0, valueHigh2: 1) {
            red1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            red2 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 255.0))
            green1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 43.0))
            green2 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 94.0))
            blue1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 255.0))
            blue2 = CGFloat(transformColor(value: value, startColor: 200.0, stopColor: 58.0))
        }
        if let value = transformValue(value: time, valueLow: 0.35, valueHigh: 0.62, valueLow2: 0, valueHigh2: 1) {
            red1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 80.0))
            red2 = CGFloat(transformColor(value: value, startColor: 255.0, stopColor: 80.0))
            green1 = CGFloat(transformColor(value: value, startColor: 43.0, stopColor: 217.0))
            green2 = CGFloat(transformColor(value: value, startColor: 94.0, stopColor: 176.0))
            blue1 = CGFloat(transformColor(value: value, startColor: 255.0, stopColor: 242.0))
            blue2 = CGFloat(transformColor(value: value, startColor: 58.0, stopColor: 242.0))
        }
        if let value = transformValue(value: time, valueLow: 0.62, valueHigh: 0.87, valueLow2: 0, valueHigh2: 1) {
            red1 = CGFloat(transformColor(value: value, startColor: 80.0, stopColor: 10.0))
            red2 = CGFloat(transformColor(value: value, startColor: 80.0, stopColor: 255.0))
            green1 = CGFloat(transformColor(value: value, startColor: 217.0, stopColor: 43.0))
            green2 = CGFloat(transformColor(value: value, startColor: 176.0, stopColor: 94.0))
            blue1 = CGFloat(transformColor(value: value, startColor: 242.0, stopColor: 255.0))
            blue2 = CGFloat(transformColor(value: value, startColor: 242.0, stopColor: 58.0))
        }
        if let value = transformValue(value: time, valueLow: 0.87, valueHigh: 0.9, valueLow2: 0, valueHigh2: 1) {
            red1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            red2 = CGFloat(transformColor(value: value, startColor: 255.0, stopColor: 10.0))
            green1 = CGFloat(transformColor(value: value, startColor: 43.0, stopColor: 10.0))
            green2 = CGFloat(transformColor(value: value, startColor: 94.0, stopColor: 10.0))
            blue1 = CGFloat(transformColor(value: value, startColor: 255.0, stopColor: 10.0))
            blue2 = CGFloat(transformColor(value: value, startColor: 58.0, stopColor: 200.0))
        }
        if let value = transformValue(value: time, valueLow: 0.9, valueHigh: 1, valueLow2: 0, valueHigh2: 1) {
            red1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            red2 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            green1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            green2 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            blue1 = CGFloat(transformColor(value: value, startColor: 10.0, stopColor: 10.0))
            blue2 = CGFloat(transformColor(value: value, startColor: 200.0, stopColor: 130.0))
        }
        
        let colorTop =  UIColor(red: red1/255.0, green: green1/255.0, blue: blue1/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: red2/255.0, green: green2/255.0, blue: blue2/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        return gradientLayer
    }
    
    func createSliderView(){
        slider.addTarget(self, action: #selector(sliderValueChanged(sender:)), for: .valueChanged)
        sliderView.addSubview(slider)
    }
    
    func setSunPosition(time: Float){
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior!)
        }
        
        if let value = transformValue(value: time, valueLow: 0.3, valueHigh: 0.87, valueLow2: 0, valueHigh2: 1) {
            let r: CGFloat = 350
            let fi = CGFloat(value) * 180 + 180
            let x = r * cos(fi * Double.pi / 180) + view.bounds.width / 2
            let y = r * sin(fi * Double.pi / 180) + view.bounds.height / 2
            
            print("x = \(x), y = \(y), fi = \(fi)")
            snapBehavior = UISnapBehavior(item: sunView, snapTo: CGPoint(x: x, y: y))
            snapBehavior?.damping = 1
            animator.addBehavior(snapBehavior!)
        }
    }
    func createConstraints(){
        
        NSLayoutConstraint.activate([
            sliderView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            sliderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            sliderView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 9/10),
            sliderView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: sliderView.centerYAnchor),
            slider.centerXAnchor.constraint(equalTo: sliderView.centerXAnchor),
            slider.widthAnchor.constraint(equalTo: sliderView.widthAnchor, multiplier: 4/5)
        ])
    }
    @objc func sliderValueChanged(sender: UISlider) {
    
        self.view.layer.sublayers![0] = lightingDuringTheDay(time: sender.value)
        setSunPosition(time: sender.value)
       
    }
}



