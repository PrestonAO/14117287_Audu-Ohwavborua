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
    
    let carImages = ["car3", "car6", "carp", "carx"]
    let randomCarArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        gravityBehaviour = UIGravityBehavior(items: [ObstacleView, ObstacleView1, ObstacleView2, ObstacleView3])
        dynamicAnimator.addBehavior(gravityBehaviour)
        
        collisionBehaviour = UICollisionBehavior(items: [ObstacleView, ObstacleView1, ObstacleView2, ObstacleView3])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = false
        dynamicAnimator.addBehavior(collisionBehaviour)
        
        self.view.addSubview(CarView)
        self.view.bringSubview(toFront: CarView)
        
        for index in 0...19 {
            
            let delay = Double(self.randomCarArray[index])
            
            let when = DispatchTime.now() + delay
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                self.ObstacleView.isHidden = false
                
                let leftObstacle = arc4random_uniform(20)
                let ObstacleView = UIImageView(image: nil)
                let screenWidth = UIScreen.main.bounds.width
                
                switch leftObstacle {
                case 1: ObstacleView.image = UIImage(named: "car3.png")
                case 2: ObstacleView.image = UIImage(named: "carp.png")
                case 3: ObstacleView.image = UIImage(named: "car6.png")
                case 4: ObstacleView.image = UIImage(named: "carx.png")
                    
                default:
                    ObstacleView.image = UIImage(named: "carx.png")
                }
                
                ObstacleView.frame = CGRect(x: Int(arc4random_uniform(UInt32(screenWidth))), y: 0, width: 30, height: 50)
                
                self.view.addSubview(ObstacleView)
                
                self.dynamicItemBehaviour = UIDynamicItemBehavior(items: [ObstacleView])
            self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: 0, y: 100), for: ObstacleView)
            self.dynamicAnimator.addBehavior(self.dynamicItemBehaviour)
             
                
                
            }
            
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

