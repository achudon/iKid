//
//  GoodJokeSwitchController.swift
//  iKid
//
//  Created by iGuest on 4/27/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class GoodJokeSwitchController: UIViewController {
    
    private var goodJokeViewController1 : GoodJokeViewController1!
    private var goodJokeViewController2 : GoodJokeViewController2!
    
    private func firstBuilder() {
        if goodJokeViewController1 == nil {
            goodJokeViewController1 =
                storyboard?
                    .instantiateViewControllerWithIdentifier("Good1")
                as! GoodJokeViewController1
        }
    }
    private func secondBuilder() {
        if goodJokeViewController2 == nil {
            goodJokeViewController2 =
                storyboard?
                    .instantiateViewControllerWithIdentifier("Good2")
                as! GoodJokeViewController2
        }
    }
    
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if goodJokeViewController1 != nil &&
            goodJokeViewController1?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            goodJokeViewController2.view.frame = view.frame
            switchViewController(goodJokeViewController1, to: goodJokeViewController2)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            goodJokeViewController1.view.frame = view.frame
            switchViewController(goodJokeViewController2, to: goodJokeViewController1)
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

        self.addChildViewController(goodJokeViewController1)
        self.view.insertSubview(goodJokeViewController1.view, atIndex: 0)
        goodJokeViewController1.didMoveToParentViewController(self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
