//
//  Character.swift
//  SushiNeko
//
//  Created by Nicolas Schneider on 10/18/21.
//

import SpriteKit

class Character: SKSpriteNode {
//    character side
    var side: Side = .LEFT {
        didSet {
            if side == .LEFT {
                xScale = 1
                position.x = 70
            } else {
                xScale = -1
                position.x = 252
            }
        }
    }
    /* You are required to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }

    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
