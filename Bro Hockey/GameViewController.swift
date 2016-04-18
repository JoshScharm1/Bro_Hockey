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
    
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var centerLine: UIImageView!
    
    var puck = UIView()
    var collisionBehavior = UICollisionBehavior()
    var centerLineBehavior = UICollisionBehavior()
    var myDynamicAnimator = UIDynamicAnimator()
    var everythingArray : [UIView] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        puck = UIView(frame: CGRectMake(view.center.x - 10, view.center.y, 25, 25))
        puck.backgroundColor = UIColor(patternImage: UIImage(named: "puck")!)
  
        view.addSubview(puck)
        view.addSubview(imageViewOne)
        view.addSubview(imageViewTwo)
    
        myDynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        let puckDynamicBehavior = UIDynamicItemBehavior(items: [puck])
        puckDynamicBehavior.friction = 0.0
        puckDynamicBehavior.resistance = 0.0
        puckDynamicBehavior.elasticity = 1.0
        puckDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(puckDynamicBehavior)
        
        let paddleOneDynamicBehavior = UIDynamicItemBehavior(items: [imageViewOne])
        paddleOneDynamicBehavior.density = 10000.0
        paddleOneDynamicBehavior.resistance = 0.0
        paddleOneDynamicBehavior.elasticity = 1.0
        paddleOneDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(paddleOneDynamicBehavior)
        
        let paddleTwoDynamicBehavior = UIDynamicItemBehavior(items: [imageViewTwo])
        paddleTwoDynamicBehavior.density = 10000.0
        paddleTwoDynamicBehavior.resistance = 0.0
        paddleTwoDynamicBehavior.elasticity = 1.0
        paddleTwoDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(paddleTwoDynamicBehavior)
        
        everythingArray.append(puck)
        everythingArray.append(imageViewOne)
        everythingArray.append(imageViewTwo)
        
        
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
        
        var point = sender.locationInView(view)
        
        if point.y <= view.frame.height/2 - 50
        {
            imageViewOne.center = CGPointMake(point.x, point.y)
             myDynamicAnimator.updateItemUsingCurrentState(imageViewOne)
        }
        if point.y >= view.frame.height/2 + 50
        {
            imageViewTwo.center = CGPointMake(point.x, point.y)
            myDynamicAnimator.updateItemUsingCurrentState(imageViewTwo)
        }
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint)
    {
       if item.isEqual(puck) && p.y >= centerLine.center.y
       {
            puck.backgroundColor = UIColor.redColor()
        }
        if item.isEqual(puck) && p.y <= centerLine.center.y
        {
            puck.backgroundColor = UIColor.greenColor()
        }
                
    }
            
    
    
    
    
    
    
    
    }
    

    
    
  