//
//  GameViewController.swift
//  Bro Hockey
//
//  Created by JScharm on 4/5/16.
//  Copyright © 2016 JScharm. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollisionBehaviorDelegate
{
    var paddleOne = UIView()
    var paddleTwo = UIView()
    var puck = UIView()
    var collisionBehavior = UICollisionBehavior()
    var myDynamicAnimator = UIDynamicAnimator()
    var everythingArray : [UIView] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        puck = UIView(frame: CGRectMake(view.center.x - 10, view.center.y, 25, 25))
        
        paddleOne = UIView(frame: CGRectMake(view.center.x - 40, view.center.y * 1.7, -30, 20))
        paddleOne.backgroundColor = UIColor.blueColor()
        view.addSubview(paddleOne)
        paddleOne.layer.cornerRadius = 5
        paddleOne.clipsToBounds = true
        
        paddleTwo = UIView(frame: CGRectMake(view.center.x - 40, view.center.y * 1.7, 80, 20))
        paddleTwo.backgroundColor = UIColor.redColor()
        view.addSubview(paddleTwo)
        paddleTwo.layer.cornerRadius = 5
        paddleTwo.clipsToBounds = true
        
        
        myDynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        let puckDynamicBehavior = UIDynamicItemBehavior(items: [puck])
        puckDynamicBehavior.friction = 0.0
        puckDynamicBehavior.resistance = 0.0
        puckDynamicBehavior.elasticity = 1.0
        puckDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(puckDynamicBehavior)
        
        let paddleOneDynamicBehavior = UIDynamicItemBehavior(items: [paddleOne])
        paddleOneDynamicBehavior.density = 10000.0
        paddleOneDynamicBehavior.resistance = 0.0
        paddleOneDynamicBehavior.elasticity = 1.0
        paddleOneDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(paddleOneDynamicBehavior)
        
        let paddleTwoDynamicBehavior = UIDynamicItemBehavior(items: [paddleTwo])
        paddleTwoDynamicBehavior.density = 10000.0
        paddleTwoDynamicBehavior.resistance = 0.0
        paddleTwoDynamicBehavior.elasticity = 1.0
        paddleTwoDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(paddleTwoDynamicBehavior)
        
        everythingArray.append(puck)
        everythingArray.append(paddleOne)
        everythingArray.append(paddleTwo)
        
        
        let pushBehavior = UIPushBehavior(items: [puck], mode: .Instantaneous)
        pushBehavior.angle = 1.1
        pushBehavior.magnitude = 0.2
        myDynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: everythingArray)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        myDynamicAnimator.addBehavior(collisionBehavior)


        
    }
    
  
    @IBAction func panGesture(sender: UIPanGestureRecognizer)
    {
        print("slide")
        
        let panGestureOne = sender.locationInView(view).x
        paddleOne.center = CGPointMake(panGestureOne, paddleOne.center.y)
        
        myDynamicAnimator.updateItemUsingCurrentState(paddleOne)
        
        let panGestureTwo = sender.locationInView(view).x
        paddleTwo.center = CGPointMake(panGestureTwo, paddleTwo.center.y)
        
        myDynamicAnimator.updateItemUsingCurrentState(paddleTwo)
    }
    
}
