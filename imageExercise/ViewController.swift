//
//  ViewController.swift
//  imageExercise
//
//  Created by John Gallaugher on 2/6/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var originalImageBounds: CGRect!
    var originalImageFrame: CGRect!
    var originalViewCenterX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalImageBounds = imageView.bounds
        originalImageFrame = imageView.frame
        originalViewCenterX = self.view.center.x
    }

    @IBAction func resetPressed(_ sender: Any) {
        imageView.bounds = originalImageBounds
        imageView.frame = originalImageFrame
        self.view.center.x = originalViewCenterX
        imageView.alpha = 1.0
        
        // .identity will clear any changes made using transform
        imageView.transform = CGAffineTransform.identity
        self.view.backgroundColor = UIColor.white
    }
    
    @IBAction func increased60Pressed(_ sender: UIButton) {
        let newBounds = CGRect(x: imageView.bounds.origin.x - 60, y: imageView.bounds.origin.y - 60, width: imageView.bounds.width + 60, height: imageView.bounds.height + 60)
        
        UIView.animate(withDuration: 0.5, animations: { self.imageView.bounds = newBounds } )
    }

    @IBAction func decreaseBy60Pressed(_ sender: UIButton) {
        let newBounds = CGRect(x: imageView.bounds.origin.x + 60, y: imageView.bounds.origin.y + 60, width: imageView.bounds.width - 60, height: imageView.bounds.height - 60)
        
        UIView.animate(withDuration: 0.5, animations: { self.imageView.bounds = newBounds } )
    }
    
    @IBAction func pushRightPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25, animations: {
            self.imageView.frame.origin.x = self.view.frame.size.width})
    }
    
    @IBAction func slideScreen100Pressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.center.x += 100})
    }
    
    @IBAction func fadePressed(_ sender: UIButton) {
        UIView.animate(withDuration: 5.0, animations: { self.imageView.alpha = 0 })
    }
    
    
    @IBAction func doA180Pressed(_ sender: UIButton) {
        // CGAffineTransformTransform(rotationAngel: works off of radians, so
        // if you're like me & think degrees instead, the code below will process
        // a degree rotation. Note a 360 is different, it'll involve a new set of technologies, as will continued spin.  I can cover that in a future class, if you'd like.
        let rotateInDegrees: CGFloat = 180
        
        UIView.animate(withDuration: 0.5, animations:
            { self.imageView.transform = CGAffineTransform(rotationAngle:
                (rotateInDegrees * CGFloat(Double.pi)) / 180.0)})
    }
    
    @IBAction func changeBackgroundColorPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2.0, animations: {
            self.view.backgroundColor = UIColor.red })
    }
    
    @IBAction func loopLogoPressed(_ sender: UIButton) {
        if self.imageView.frame.origin.x >= self.view.frame.size.width {
            self.imageView.frame.origin.x = 0 - self.imageView.bounds.width
        }
        
        let moveBy:CGFloat = 100
        UIView.animate(withDuration: 0.25, animations:
            { self.imageView.frame.origin.x = self.imageView.frame.origin.x +
                moveBy})
    }
    
}

