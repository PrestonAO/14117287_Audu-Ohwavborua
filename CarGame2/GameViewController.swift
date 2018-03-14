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

    @IBOutlet weak var RoadA: UIImageView!
    @IBOutlet weak var CarView: DraggedImage!
    @IBOutlet weak var ObstacleView: UIImageView!
    @IBOutlet weak var ObstacleView1: UIImageView!
    @IBOutlet weak var ObstacleView2: UIImageView!
    @IBOutlet weak var ObstacleView3: UIImageView!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        self.view.addSubview(CarView)
        self.view.bringSubview(toFront: CarView)
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.ObstacleView.isHidden = false
            self.ObstacleView1.isHidden = false
            self.ObstacleView2.isHidden = false
            self.ObstacleView3.isHidden = false

        }
        
        
        var imagearray: [UIImage]
        
         imagearray = [UIImage(named: "road1.png")!,UIImage(named: "road2.png")!,UIImage(named: "road3.png")!,UIImage(named: "road4.png")!,UIImage(named: "road5.png")!,UIImage(named: "road6.png")!,UIImage(named: "road7.png")!,UIImage(named: "road8.png")!,UIImage(named: "road9.png")!,UIImage(named: "road10.png")!,UIImage(named: "road11.png")!,UIImage(named: "road12.png")!,UIImage(named: "road13.png")!,UIImage(named: "road14.png")!,UIImage(named: "road15.png")!,UIImage(named: "road16.png")!,UIImage(named: "road17.png")!,UIImage(named: "road18.png")!,UIImage(named: "road19.png")!,UIImage(named: "road20.png")!]
        
        RoadA.image = UIImage.animatedImage(with: imagearray, duration: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}

