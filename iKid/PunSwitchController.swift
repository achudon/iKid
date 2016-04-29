//
//  PunSwitchController.swift
//  iKid
//
//  Created by iGuest on 4/29/16.
//  Copyright © 2016 iGuest. All rights reserved.
//


import UIKit

class PunSwitchController: UIViewController {
    
    private var punViewController1 : PunViewController1!
    private var punViewController2 : PunViewController2!
    
    private func firstBuilder() {
        if punViewController1 == nil {
            punViewController1 =
                storyboard?
                    .instantiateViewControllerWithIdentifier("Pun1")
                as! PunViewController1
        }
    }
    private func secondBuilder() {
        if punViewController2 == nil {
            punViewController2 =
                storyboard?
                    .instantiateViewControllerWithIdentifier("Pun2")
                as! PunViewController2
        }
    }
    
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if punViewController1 != nil &&
            punViewController1?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            punViewController2.view.frame = view.frame
            switchViewController(punViewController1, to: punViewController2)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            punViewController1.view.frame = view.frame
            switchViewController(punViewController2, to: punViewController1)
        }
        UIView.commitAnimations()
    }
    
    func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMoveToParentViewController(nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, atIndex: 0)
            to!.didMoveToParentViewController(self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstBuilder()
        
        self.addChildViewController(punViewController1)
        self.view.insertSubview(punViewController1.view, atIndex: 0)
        punViewController1.didMoveToParentViewController(self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


