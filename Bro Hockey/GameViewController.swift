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
    @IBOutlet weak var bottomGoalScore: UIImageView!
    @IBOutlet weak var bottomLeftGoalPost: UIImageView!
    @IBOutlet weak var bottomRightGoalPost: UIImageView!
    @IBOutlet weak var topGoalScore: UIImageView!
    @IBOutlet weak var topLeftGoalPost: UIImageView!
    @IBOutlet weak var topRightGoalPost: UIImageView!
    @IBOutlet weak var topSideLivesLabel: UILabel!
    @IBOutlet weak var bottomSideLivesLabel: UILabel!
    
    
    
    var puck = UIView()
    var collisionBehavior = UICollisionBehavior()
    var myDynamicAnimator = UIDynamicAnimator()
    var everythingArray : [UIView] = []
    var livesOne = 0
    var LivesTwo = 0
    
    
  

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        puck = UIView(frame: CGRectMake(view.center.x, view.center.y, 24, 24))
        puck.backgroundColor = UIColor(patternImage: UIImage(named: "puck")!)
  
        view.addSubview(puck)
        view.addSubview(imageViewOne)
        view.addSubview(imageViewTwo)
        view.addSubview(bottomGoalScore)
        view.addSubview(bottomLeftGoalPost)
        view.addSubview(bottomRightGoalPost)
        view.addSubview(topGoalScore)
        view.addSubview(topLeftGoalPost)
        view.addSubview(topRightGoalPost)
        
     
    
        myDynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        let puckDynamicBehavior = UIDynamicItemBehavior(items: [puck])
        puckDynamicBehavior.friction = 0.0
        puckDynamicBehavior.resistance = 0.0
        puckDynamicBehavior.elasticity = 1.0
        puckDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(puckDynamicBehavior)
      
        let bottomGoalScoreDynamicBehavior = UIDynamicItemBehavior(items: [bottomGoalScore])
        bottomGoalScoreDynamicBehavior.density = 100000.0
        bottomGoalScoreDynamicBehavior.anchored = true
        bottomGoalScoreDynamicBehavior.friction = 0.0
        bottomGoalScoreDynamicBehavior.resistance = 0.0
        bottomGoalScoreDynamicBehavior.elasticity = 1.0
        bottomGoalScoreDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(bottomGoalScoreDynamicBehavior)
        
        let bottomLeftGoalPostDynamicBehavior = UIDynamicItemBehavior(items: [bottomLeftGoalPost])
        bottomLeftGoalPostDynamicBehavior.density = 100000.0
        bottomLeftGoalPostDynamicBehavior.anchored = true
        bottomLeftGoalPostDynamicBehavior.friction = 0.0
        bottomLeftGoalPostDynamicBehavior.resistance = 0.0
        bottomLeftGoalPostDynamicBehavior.elasticity = 1.0
        bottomLeftGoalPostDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(bottomLeftGoalPostDynamicBehavior)
        
        let bottomRightDynamicBehavior = UIDynamicItemBehavior(items: [bottomRightGoalPost])
        bottomRightDynamicBehavior.density = 100000.0
        bottomRightDynamicBehavior.anchored = true
        bottomRightDynamicBehavior.friction = 0.0
        bottomRightDynamicBehavior.resistance = 0.0
        bottomRightDynamicBehavior.elasticity = 1.0
        bottomRightDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(bottomRightDynamicBehavior)
        
        let topGoalScoreDynamicBehavior = UIDynamicItemBehavior(items: [topGoalScore])
        topGoalScoreDynamicBehavior.density = 100000.0
        topGoalScoreDynamicBehavior.anchored = true
        topGoalScoreDynamicBehavior.friction = 0.0
        topGoalScoreDynamicBehavior.resistance = 0.0
        topGoalScoreDynamicBehavior.elasticity = 1.0
        topGoalScoreDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(topGoalScoreDynamicBehavior)
        
        let topLeftGoalPostDynamicBehavior = UIDynamicItemBehavior(items: [topLeftGoalPost])
        topLeftGoalPostDynamicBehavior.density = 100000.0
        topLeftGoalPostDynamicBehavior.anchored = true
        topLeftGoalPostDynamicBehavior.friction = 0.0
        topLeftGoalPostDynamicBehavior.resistance = 0.0
        topLeftGoalPostDynamicBehavior.elasticity = 1.0
        topLeftGoalPostDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(topLeftGoalPostDynamicBehavior)
        
        let topRightGoalPostDynamicBehavior = UIDynamicItemBehavior(items: [topRightGoalPost])
        topRightGoalPostDynamicBehavior.density = 100000.0
        topRightGoalPostDynamicBehavior.anchored = true
        topRightGoalPostDynamicBehavior.friction = 0.0
        topRightGoalPostDynamicBehavior.resistance = 0.0
        topRightGoalPostDynamicBehavior.elasticity = 1.0
        topRightGoalPostDynamicBehavior.allowsRotation = false
        myDynamicAnimator.addBehavior(topRightGoalPostDynamicBehavior)
        
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
        everythingArray.append(bottomGoalScore)
        everythingArray.append(bottomRightGoalPost)
        everythingArray.append(bottomLeftGoalPost)
        everythingArray.append(topGoalScore)
        everythingArray.append(topLeftGoalPost)
        everythingArray.append(topRightGoalPost)
        
        collisionBehavior = UICollisionBehavior(items: everythingArray)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        myDynamicAnimator.addBehavior(collisionBehavior)
        
        

    }
  
 
    @IBAction func panGesture(sender: UIPanGestureRecognizer)
    {
        
        var point = sender.locationInView(view)
        
        if point.y <= view.frame.height/2 - 40
        {
            imageViewOne.center = CGPointMake(point.x, point.y)
             myDynamicAnimator.updateItemUsingCurrentState(imageViewOne)
        }
        if point.y >= view.frame.height/2 + 40
        {
            imageViewTwo.center = CGPointMake(point.x, point.y)
            myDynamicAnimator.updateItemUsingCurrentState(imageViewTwo)
        }
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint)
    {

        }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint)
    {
        let pushBehavior = UIPushBehavior(items: [puck], mode: .Instantaneous)
        pushBehavior.angle = 1.1
        pushBehavior.magnitude = 0.2
        
        var firstHit = false
        
       if firstHit == false
       {
        
        
        
         if item1.isEqual(puck) && item2.isEqual(imageViewOne) || item1.isEqual(imageViewOne) && item2.isEqual(puck)
         {
             myDynamicAnimator.addBehavior(pushBehavior)
            
            
        }
        if item1.isEqual(puck) && item2.isEqual(imageViewTwo) || item1.isEqual(imageViewTwo) && item2.isEqual(puck)
        {
             myDynamicAnimator.addBehavior(pushBehavior)
        }
        
        firstHit = true
        }
    
        if item1.isEqual(puck) && item2.isEqual(topGoalScore) || item1.isEqual(topGoalScore) && item2.isEqual(puck)
            {
                livesOne++
                bottomSideLivesLabel.text = "\(livesOne)"
                puck.center = view.center
                myDynamicAnimator.updateItemUsingCurrentState(puck)
                imageViewTwo.center.x = view.center.x - 90
                imageViewTwo.center.y = view.center.y + 90
                imageViewOne.center.x = view.center.x - 90
                imageViewOne.center.y = view.center.y - 90
                  myDynamicAnimator.updateItemUsingCurrentState(imageViewOne)
                myDynamicAnimator.updateItemUsingCurrentState(imageViewTwo)

            }
        if item1.isEqual(puck) && item2.isEqual(bottomGoalScore) || item1.isEqual(bottomGoalScore) && item2.isEqual(puck)
        {
            LivesTwo++
            topSideLivesLabel.text = "\(LivesTwo)"
            puck.center = view.center
            myDynamicAnimator.updateItemUsingCurrentState(puck)
            imageViewTwo.center.x = view.center.x - 90
            imageViewTwo.center.y = view.center.y + 90
            imageViewOne.center.x = view.center.x - 90
            imageViewOne.center.y = view.center.y - 90
            myDynamicAnimator.updateItemUsingCurrentState(imageViewTwo)
            myDynamicAnimator.updateItemUsingCurrentState(imageViewOne)

        }

        }
    
    
    
    
    }
    
    
    
    
    

    
    
