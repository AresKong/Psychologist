//
//  ViewController.swift
//  Psychologist
//
//  Created by Weirui Kong on 2016-07-18.
//  Copyright © 2016 Weirui Kong. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let svc = destination as? SingleViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad":
                    svc.happiness = 0
                case "happy":
                    svc.happiness = 100
                case "nothing":
                    svc.happiness = 25
                default:
                    svc.happiness = 50
                }
            }
        }
    }

}

