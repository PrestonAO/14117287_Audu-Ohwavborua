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
protocol subviewDelegate {
    
    func changeSomething()
}

class GameViewController: UIViewController, subviewDelegate {
    
    var carAnimator: UIDynamicAnimator!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var collisionBehaviour: UICollisionBehavior!
    
    let randomCarArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    
    @IBOutlet weak var RoadA: UIImageView!
    @IBOutlet weak var CarView: DraggedImage!
    
    
    func changeSomething()
    {

        collisionBehaviour.addBoundary(withIdentifier: "playercar" as
            NSCopying, for: UIBezierPath(rect: CarView.frame))
    }
    
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        CarView.myDelegate = self
    
        self.view.addSubview(CarView)
        self.view.bringSubview(toFront: CarView)
        
        carAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehaviour = UIDynamicItemBehavior(items:[])
        collisionBehaviour = UICollisionBehavior(items:[])
        
        
        
        
        for index in 0...29 {
            
            let delay = Double(self.randomCarArray[index])
            
            let when = DispatchTime.now() + delay
            
        DispatchQueue.main.asyncAfter(deadline: when) {
            
            let Obstacle = arc4random_uniform(20)
            let ObstacleView = UIImageView(image: nil)
            let screenWidth = UIScreen.main.bounds.width
                
            switch Obstacle {
                case 1: ObstacleView.image = UIImage(named: "car3.png")
                case 2: ObstacleView.image = UIImage(named: "carp.png")
                case 3: ObstacleView.image = UIImage(named: "car6.png")
                case 4: ObstacleView.image = UIImage(named: "carx.png")
                default:
                    ObstacleView.image = UIImage(named: "carx.png")
                }
                
                ObstacleView.frame = CGRect(x: Int(arc4random_uniform(UInt32(screenWidth))), y: 0, width: 40, height:65 )
                
            self.view.addSubview(ObstacleView)
            self.view.bringSubview(toFront: ObstacleView)
                
            self.dynamicItemBehaviour.addItem(ObstacleView)
            self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: 0, y: 300), for: ObstacleView)
            self.collisionBehaviour.addItem(ObstacleView)
            }
        }
        
        carAnimator.addBehavior(dynamicItemBehaviour)
        collisionBehaviour = UICollisionBehavior(items: [])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = false
        carAnimator.addBehavior(collisionBehaviour)
        
        let endGame = DispatchTime.now() + 20
        DispatchQueue.main.asyncAfter(deadline: endGame) {
            
            let GameOver = UIImageView(image: UIImage(named: "game_over.jpg"))
            GameOver.frame = UIScreen.main.bounds
            self.view.addSubview(GameOver)
            self.view.bringSubview(toFront: GameOver)
            
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

