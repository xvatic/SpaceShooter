//
//  GameScene.swift
//  SpaceShooter
//
//  Created by Евгений on 5/22/20.
//  Copyright © 2020 Евгений. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var starfield:SKEmitterNode!
    var player:SKSpriteNode!
    var scorelabel:SKLabelNode!
    var score:Int = 0{
        didSet{
            scorelabel.text = "Score: \(score)"
            
        }
    }
    
    var gameTimer:Timer!
    var possibleAliens = ["alien", "alient2", "alien3"]
    

    override func didMove(to view: SKView) {
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 0, y: 1472)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "shuttle")
        player.position = CGPoint(x: self.frame.size.width / 2, y: player.size.height / 2 + 20)
        self.addChild(player)
       
        scorelabel = SKLabelNode(text: "Score: 0")
        scorelabel.position = CGPoint(x: 100, y: self.frame.size.height - 60)
        scorelabel.fontName = "AmericanTypewriter-Bold"
        scorelabel.fontSize = 36
        scorelabel.fontColor = UIColor.white
        score = 0
        
        self.addChild(scorelabel)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
        
    }
    
    
    func addAlien()  {
        possibleAliens = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleAliens) as! [String]
    }
    
    
   
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
