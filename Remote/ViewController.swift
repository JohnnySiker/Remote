//
//  ViewController.swift
//  Remote
//
//  Created by Jonathan Velazquez on 25/12/15.
//  Copyright © 2015 Jonathan Velazquez. All rights reserved.
//

import UIKit
import BubbleTransition


class ViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var btn_Central: UIButton!
    @IBOutlet weak var btn_Peripheral: UIButton!
    
    
    let transition = BubbleTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
    }
    
    
    func setupButtons(){
        btn_Central.layer.cornerRadius = 60
        btn_Peripheral.layer.cornerRadius = 60
    }
    
    
    func presentViewControllerWithIndetifier(identifier:String){
        
        let viewToPresent = self.storyboard?.instantiateViewControllerWithIdentifier(identifier)
        if (viewToPresent != nil) {
            self.presentViewController(viewToPresent!, animated: true, completion: nil)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        
        switch segue.identifier! {
            case "beCentral":
                controller.transitioningDelegate = self
                controller.modalPresentationStyle = .Custom
                
                transition.bubbleColor = btn_Central.backgroundColor!
            break
            case "bePeripheral":
                controller.transitioningDelegate = self
                controller.modalPresentationStyle = .Custom
                
                transition.bubbleColor = btn_Peripheral.backgroundColor!
            break
            default:
                
            break
        }
        
    }

    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = self.view.center
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = self.view.center
        return transition
    }

}

