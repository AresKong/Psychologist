//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Weirui Kong on 2016-07-18.
//  Copyright © 2016 Weirui Kong. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: SingleViewController, UIPopoverPresentationControllerDelegate {
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    var diagnosticHistory: [Int] {
        get {
            return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
}