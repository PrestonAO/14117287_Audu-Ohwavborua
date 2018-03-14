//
//  GameViewController.swift
//  CarGame2
//
//  Created by Preston Audu on 13/03/2018.
//  Copyright © 2018 Preston Audu. All rights reserved.
//
// connected existing repository today
import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var collisionBehaviour: UICollisionBehavior!
    
    @IBOutlet weak var RoadA: UIImageView!
    @IBOutlet weak var CarView: DraggedImage!
    @IBOutlet weak var ObstacleView: UIImageView!
    @IBOutlet weak var ObstacleView1: UIImageView!
    @IBOutlet weak var ObstacleView2: UIImageView!
    @IBOutlet weak var ObstacleView3: UIImageView!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        dynamicItemBehaviour = UIDynamicItemBehavior(items: [ObstacleView])
        self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: 0, y: 100), for: ObstacleView)
        dynamicAnimator.addBehavior(dynamicItemBehaviour)
        dynamicItemBehaviour = UIDynamicItemBehavior(items: [ObstacleView1])
        self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: 0, y: 200), for: ObstacleView1)
        dynamicAnimator.addBehavior(dynamicItemBehaviour)
        dynamicItemBehaviour = UIDynamicItemBehavior(items: [ObstacleView2])
        self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: 0, y: 100), for: ObstacleView2)
        dynamicAnimator.addBehavior(dynamicItemBehaviour)
        dynamicItemBehaviour = UIDynamicItemBehavior(items: [ObstacleView3])
        self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: 0, y: 200), for: ObstacleView3)
        dynamicAnimator.addBehavior(dynamicItemBehaviour)
        
        gravityBehaviour = UIGravityBehavior(items: [ObstacleView, ObstacleView1, ObstacleView2, ObstacleView3])
        dynamicAnimator.addBehavior(gravityBehaviour)
        
        collisionBehaviour = UICollisionBehavior(items: [ObstacleView, ObstacleView1, ObstacleView2, ObstacleView3])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehaviour)
        
        self.view.addSubview(CarView)
        self.view.bringSubview(toFront: CarView)
        
        let when = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.ObstacleView.isHidden = false
            self.ObstacleView1.isHidden = false
            self.ObstacleView2.isHidden = false
            self.ObstacleView3.isHidden = false

        }
        
        var imagearray: [UIImage]
        
         imagearray = [UIImage(named: "road1.png")!,UIImage(named: "road2.png")!,UIImage(named: "road3.png")!,UIImage(named: "road4.png")!,UIImage(named: "road5.png")!,UIImage(named: "road6.png")!,UIImage(named: "road7.png")!,UIImage(named: "road8.png")!,UIImage(named: "road9.png")!,UIImage(named: "road10.png")!,UIImage(named: "road11.png")!,UIImage(named: "road12.png")!,UIImage(named: "road13.png")!,UIImage(named: "road14.png")!,UIImage(named: "road15.png")!,UIImage(named: "road16.png")!,UIImage(named: "road17.png")!,UIImage(named: "road18.png")!,UIImage(named: "road19.png")!,UIImage(named: "road20.png")!]
        
        RoadA.image = UIImage.animatedImage(with: imagearray, duration: 0.2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}

