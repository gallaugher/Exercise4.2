//
//  ViewController.swift
//  imageExercise
//
//  Created by John Gallaugher on 2/6/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageToPunch: UIImageView!
    var originalBounds: CGRect!
    var originalFrame: CGRect!
    var originalX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        originalBounds = imageToPunch.bounds
        originalFrame = imageToPunch.frame
        originalX = self.view.center.x
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetPressed(_ sender: Any) {
        imageToPunch.bounds = originalBounds
        imageToPunch.frame = originalFrame
        self.view.center.x = originalX
        imageToPunch.alpha = 1.0
        imageToPunch.transform = CGAffineTransform.identity
        self.view.backgroundColor = UIColor.white
    }

    @IBAction func increased60Pressed(_ sender: UIButton) {
        
        let expandBy: CGFloat = 60
        let newBounds = CGRect(x: self.imageToPunch.bounds.origin.x - expandBy, y: self.imageToPunch.bounds.origin.y - expandBy, width: self.imageToPunch.bounds.size.width + expandBy, height: self.imageToPunch.bounds.size.height + expandBy)
        
        // Without Spring
                UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
                        self.imageToPunch.bounds = newBounds}
                    , completion: nil )
        
        // With Spring
//        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {
//                self.imageToPunch.bounds = newBounds}
//            , completion: nil )
    }

    @IBAction func pushRightPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.imageToPunch.frame.origin.x = self.view.frame.size.width}
            , completion: nil )
    }
    
    @IBAction func slideScreen100Pressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.view.center.x += 100}
            , completion: nil )
    }
    
    @IBAction func fadePressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [], animations: {
            self.imageToPunch.alpha = 0
        }
            , completion: nil )

    }
    
    func degreesToRadians(degrees: Int) -> CGFloat {
        return CGFloat(Double(degrees) * (.pi / 180))
    }
    
    @IBAction func doA180Pressed(_ sender: UIButton) {
        
        let rotateInDegrees: CGFloat = 180
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.imageToPunch.transform = CGAffineTransform(rotationAngle:(rotateInDegrees * CGFloat(M_PI)) / 180.0)}
            , completion: nil )
        
//        for _ in 1...4 {
//        UIView.animate(withDuration: 3, delay: 0.0, options: [], animations: {
//            self.imageToPunch.transform = CGAffineTransform(rotationAngle: self.degreesToRadians(degrees: 180))}
//            , completion: nil )
//        
//        UIView.animate(withDuration: 3, delay: 2.95, options: [], animations: {
//            self.imageToPunch.transform = CGAffineTransform(rotationAngle: self.degreesToRadians(degrees: 360))}
//            , completion: nil )
//        }

        
    }
    
    @IBAction func changeBackgroundColorPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [], animations: {
            self.view.backgroundColor = UIColor.red
        }
            , completion: nil )
    }
    
    @IBAction func moveLogoPressed(_ sender: UIButton) {
        
        if self.imageToPunch.frame.origin.x >= self.view.frame.size.width {
            self.imageToPunch.frame.origin.x = 0 - self.imageToPunch.bounds.width
        }
        
        let moveBy:CGFloat = 100
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.imageToPunch.frame.origin.x = self.imageToPunch.frame.origin.x + moveBy}
            , completion: nil )
    }
}

