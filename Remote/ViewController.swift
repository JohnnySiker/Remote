//
//  ViewController.swift
//  Remote
//
//  Created by Jonathan Velazquez on 25/12/15.
//  Copyright © 2015 Jonathan Velazquez. All rights reserved.
//

import UIKit
import BubbleTransition

class BubbleDelegate: NSObject,UIViewControllerTransitioningDelegate {
    let transition = BubbleTransition()
    
    init(animationOrigin:CGPoint,backgrounColor:UIColor) {
        transition.startingPoint = animationOrigin
        transition.bubbleColor = backgrounColor
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        return transition
    }
    
}


class ViewController: UIViewController {
    
    @IBOutlet weak var btn_Central: UIButton!
    @IBOutlet weak var btn_Peripheral: UIButton!
    
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
                controller.transitioningDelegate = BubbleDelegate(animationOrigin: self.view.center, backgrounColor: btn_Central.backgroundColor!)
                controller.modalPresentationStyle = .Custom
            break
            case "bePeripheral":
                controller.transitioningDelegate = BubbleDelegate(animationOrigin: self.view.center, backgrounColor: btn_Peripheral.backgroundColor!)
                controller.modalPresentationStyle = .Custom
            break
            default:
                
            break
        }
        
    }

    
    
    
}

