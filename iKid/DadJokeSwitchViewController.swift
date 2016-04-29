//
//  DadJokeSwitchViewController.swift
//  iKid
//
//  Created by iGuest on 4/29/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class DadJokeSwitchController: UIViewController {
    
    private var dadJokeViewController1 : DadJokeViewController1!
    private var dadJokeViewController2 : DadJokeViewController2!
    
    private func firstBuilder() {
        if dadJokeViewController1 == nil {
            dadJokeViewController1 =
                storyboard?
                    .instantiateViewControllerWithIdentifier("Dad1")
                as! DadJokeViewController1
        }
    }
    private func secondBuilder() {
        if dadJokeViewController2 == nil {
            dadJokeViewController2 =
                storyboard?
                    .instantiateViewControllerWithIdentifier("Dad2")
                as! DadJokeViewController2
        }
    }
    
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if dadJokeViewController1 != nil &&
            dadJokeViewController1?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            dadJokeViewController2.view.frame = view.frame
            switchViewController(dadJokeViewController1, to: dadJokeViewController2)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            dadJokeViewController1.view.frame = view.frame
            switchViewController(dadJokeViewController2, to: dadJokeViewController1)
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
        
        self.addChildViewController(dadJokeViewController1)
        self.view.insertSubview(dadJokeViewController1.view, atIndex: 0)
        dadJokeViewController1.didMoveToParentViewController(self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

