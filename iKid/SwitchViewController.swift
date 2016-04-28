//
//  SwitchViewController.swift
//  iKid
//
//  Created by iGuest on 4/27/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

public class SwitchViewController: UIViewController {
    
    private var goodJokeViewController1 : GoodJokeViewController1!
    private var goodJokeViewController2 : GoodJokeViewController2!
    
    private var dadJokeViewController1 : DadJokeViewController1!
    private var dadJokeViewController2 : DadJokeViewController2!
    
    private var punViewController1 : PunViewController1!
    private var punViewController2 : PunViewController2!
    
    
    
    private func setController(controllerName : String, controllerType : ) {
        if goodJokeViewController1 == nil {
            goodJokeViewController1 =
                storyboard?
                    .instantiateViewControllerWithIdentifier(controllerName)
                as! controllerType
        }
    }
    
    private func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("First")
                as! FirstViewController
        }
    }
    private func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("Second")
                as! SecondViewController
        }
    }
    
    public func switchViews() {
        
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(firstViewController, to: secondViewController)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(secondViewController, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    public func switchViewController(from: UIViewController?, to: UIViewController?) {
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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
