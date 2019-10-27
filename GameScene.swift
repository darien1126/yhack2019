//
//  GameScene.swift
//  YHack_1
//
//  Created by Darien Hong on 2019-10-26.
//  Copyright © 2019 Darien Hong. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
        //1
    var gameLogo: SKLabelNode!
    var bestScore: SKLabelNode!
    var level: SKLabelNode!
    var playButton: SKShapeNode!
    
    var game: GameManager!
    var bottle: SKSpriteNode!
    
 
    var background = SKSpriteNode(imageNamed: "background.jpg")

/*    let containerView = UIView(
        frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: 667.0))
    
 */
   
    
  //  var width = frame.size.width
    
  //  var containerView: UIView!
    
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = 1
        addChild(background)
        
   /*     gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
       
       */
        initializeMenu()
        
        game = GameManager()
}

    override func update(_ currentTime: TimeInterval){
        // Called before each frame is rendered
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            for node in touchedNode {
                if node.name == "play_button" {
                startGame()
            }
            }
        }
    }
    //starting the game
    private func startGame() {
        print("start game")
        
        gameLogo.run(SKAction.move(by: CGVector(dx: -50, dy: 600), duration: 0.2)){
        self.gameLogo.isHidden = true
        }
        
        playButton.run(SKAction.scale(to: 0, duration: 0.3)) {
            self.playButton.isHidden = true
        }
        
        let bottomCorner = CGPoint(x: 0, y: (frame.size.height / -2) + 20)
        bestScore.run(SKAction.move(to: bottomCorner, duration: 0.2))
        
        level.run(SKAction.scale(to: 0, duration: 3.0))

        
   //     bottle.run(SKAction.move(to: bottomCorner, duration: 4.0))
        
        let bottle2 = SKSpriteNode(imageNamed: "bottle-2")
        bottle2.zPosition = 3
        bottle2.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2);
        bottle2.size = CGSize(width: 100.0, height: 200.0)
        self.addChild(bottle2)
        
        let scaleUpAction = SKAction.scale(to: 1.5, duration: 0.5)
        let scaleDownAction = SKAction.scale(to: 0, duration: 0.5)
        let waitAction = SKAction.wait(forDuration: 0.5)
        let scaleActionSequenece = SKAction.sequence([scaleUpAction, scaleDownAction, waitAction])
        
        let repeatAction = SKAction.repeat(scaleActionSequenece, count: 10)
        bottle2.run(SKAction.wait(forDuration: 4.0))
        
        bottle2.run(repeatAction)
       
        
    }
    
    
    
    
    @objc func animate(timer: Timer){
     if let userInfo = timer.userInfo as? [String: SKSpriteNode],
        let object = userInfo["object"]{
        let bottomCorner = CGPoint(x: 0, y: (frame.size.height / -2) + 20);
        object.position = CGPoint(x: frame.size.width/2, y: frame.size.height + 5);
        object.run(SKAction.move(to: bottomCorner, duration: 5.0))
        
        
        }
    }
 
        



    private func initializeMenu(){
    //Create game title
        gameLogo = SKLabelNode(fontNamed: "Georgia-Bold")
        gameLogo.zPosition = 2
        gameLogo.position = CGPoint(x: frame.size.width/2, y: (frame.size.height - 400))
        gameLogo.fontSize = 45
        gameLogo.text = "GET THE BOTTLES"
        gameLogo.fontColor = SKColor.black
        self.addChild(gameLogo)
    
        //Create best score label
    
        bestScore = SKLabelNode(fontNamed: "Georgia")
        bestScore.zPosition = 3
        bestScore.position = CGPoint(x: frame.size.width/2, y: gameLogo.position.y - 100)
        bestScore.text = "BEST SCORE: 0"
        bestScore.fontSize = 30
        bestScore.fontColor = SKColor.black
        self.addChild(bestScore)
        
        //Level
        
        level = SKLabelNode(fontNamed: "Georgia")
        level.zPosition = 2
        level.position = CGPoint(x: frame.size.width/2, y: bestScore.position.y - 50)
        level.text = "LEVEL: 1"
        level.fontSize = 30
        level.fontColor = SKColor.black
        self.addChild(level)

        //play button
        
        playButton = SKShapeNode()
        playButton.name = "play_button"
        playButton.zPosition = 2
        playButton.position = CGPoint(x: frame.size.width/2, y: (frame.size.height / 3))
        playButton.fillColor = SKColor.black
        let topCorner = CGPoint(x: -50, y: 50)
        let bottomCorner = CGPoint(x: -50, y: -50)
        let middle = CGPoint(x: 50, y: 0)
        let path = CGMutablePath()
        path.addLine(to: topCorner)
        path.addLines(between: [topCorner, bottomCorner, middle])
        playButton.path = path
        self.addChild(playButton)
        
        bottle = SKSpriteNode(imageNamed: "bottle-2")
        bottle.name = "bottle"
        bottle.position = CGPoint(x: frame.size.width/2, y: frame.size.height + 5)
        bottle.zPosition = 3
        bottle.size = CGSize(width: 100.0, height: 200.0)
        self.addChild(bottle)
    
    
}
    
        
    
}
