//
//  ViewController.swift
//  CanvasDemo
//
//  Created by Anoop tomar on 2/26/15.
//  Copyright (c) 2015 devtechie.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var trayCenter: CGPoint!
    @IBOutlet weak var trayView: UIView!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    var newFace: UIImageView!
    var newFaceOrigin: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x, y: trayView.center.y + 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPanFace(sender: UIPanGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Began {
            var imageView = sender.view as UIImageView
            newFace = UIImageView(image: imageView.image)
            view.addSubview(newFace)
            newFace.center = imageView.center
            newFace.center.y += trayView.frame.origin.y
            newFaceOrigin = newFace.center
            
            //var rec = UIPanGestureRecognizer(target: newFace, action: "handle:")
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            newFace.center = CGPoint(x: newFaceOrigin.x + sender.translationInView(view).x, y: newFaceOrigin.y + sender.translationInView(view).y)
        }
        
    }

    @IBAction func onTrayPanGesture(sender: UIPanGestureRecognizer) {
        
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if(sender.state == UIGestureRecognizerState.Began){
            trayCenter = trayView.center
        }else if(sender.state == UIGestureRecognizerState.Changed){
            //var currentPoint = CGPoint(x: trayCenter.x, y: trayCenter.y + translation.y)
            //trayView.center = currentPoint
        }else if(sender.state == UIGestureRecognizerState.Ended){
            if(velocity.y > 0){
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options:   UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.trayView.center = self.trayDown
                    }, completion: nil)
            }else{
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options:   UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.trayView.center = self.trayUp
                    }, completion: nil)
            }

        }
        
    }
}

