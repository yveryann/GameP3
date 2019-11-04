//
//  Magus.swift
//  GameP3
//
//  Created by Yann Yver on 21/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Magus: Character {
    var careLifePoints = 20
    init(name: String) {
        super.init(name: name, lifeStart: 30, life: 30)
        self.weapon = MaguStick()
    }
    
    // only the Magus can provide care
    func care(_ target: Character) {
        target.life += careLifePoints
    }
    
    override func describe() -> String {
    let dead = isDead() ? "- Mort" : "" // ternary condition
    return "🥋:\(self.name) - ❤️\(self.life) - 💊\(self.careLifePoints) \(dead)"
          }
}
