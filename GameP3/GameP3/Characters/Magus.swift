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
        super.init(name: name, lifeStart: 70, life: 70)
        self.weapon = MaguStick()
    }
    
    // only the Magus can provide care
    func care(_ target: Character) {
        target.life += careLifePoints
    }
    
    override func describe() {
    let dead = isDead() ? "- Mort" : "" // ternary condition
    print("🥋:\(self.name) - ❤️\(self.life) - 💊\(self.careLifePoints) \(dead)")
          }
}
