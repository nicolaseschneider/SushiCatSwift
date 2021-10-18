//
//  GameScene.swift
//  SushiNeko
//
//  Created by Nicolas Schneider on 10/18/21.
//

import SpriteKit

enum Side {
    case LEFT, RIGHT, NONE
}
class GameScene: SKScene {
    
    // game objects
    var sushiBasePiece: SushiPiece!
    var character: Character!
    var sushiTower: [SushiPiece] = []
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        sushiBasePiece = childNode(withName: "sushiBasePiece") as! SushiPiece
        character = childNode(withName: "character") as! Character
        sushiBasePiece.connectChopsticks()
    }
    
    func addTowerPiece(side: Side) {
        /* Copy original sushi piece */
        let newPiece = sushiBasePiece.copy() as! SushiPiece
        newPiece.connectChopsticks()

        /* Access last piece properties */
        let lastPiece = sushiTower.last

        /* Add on top of last piece, default on first piece */
        let lastPosition = lastPiece?.position ?? sushiBasePiece.position
        newPiece.position.x = lastPosition.x
        newPiece.position.y = lastPosition.y + 55

        /* Increment Z to ensure it's on top of the last piece, default on first piece*/
        let lastZPosition = lastPiece?.zPosition ?? sushiBasePiece.zPosition
        newPiece.zPosition = lastZPosition + 1

        /* Set side */
        newPiece.side = side

        /* Add sushi to scene */
        addChild(newPiece)

        /* Add sushi piece to the sushi tower */
        sushiTower.append(newPiece)
    }
}
