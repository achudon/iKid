//
//  GoodJokeViewController1.swift
//  iKid
//
//  Created by iGuest on 4/27/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation
import UIKit

class GoodJokeViewController1: UIViewController {
    
    @IBAction func SwitchGood2(sender: UIButton) {
        
        SwitchViewController.SwitchViewController(GoodJokeViewController1, to: GoodJokeViewController2)
    }
}