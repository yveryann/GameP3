//
//  Character.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Character {
    var name: String
    var statsOfFights = 0
    var lifeStart: Int
    var life: Int{
        didSet {
            if life < 0 {
                life = 0
            } else if life > lifeStart {
                life = lifeStart
            }
        }
    }
    var weapon: Weapon = Sword()
    static var names = [String]()
    
    init(name: String, lifeStart: Int, life: Int) {
        self.name = name 
        self.lifeStart = lifeStart
        self.life = life
    }
    
    func attack(_ target: Character) {
        target.life -= self.weapon.damage
        statsOfFights += 1
    }
    
    static func isAlreadyExistingName(_ name: String) -> Bool {
        if Character.names.contains(name.lowercased()){
            print("Erreur, ce nom est déjà utilisé !")
            return true
        }
        Character.names.append(name.lowercased())
        return false
    }
    
    func isDead() -> Bool {
        if life <= 0 {
            return true
        }
        return false
        }
    
    func describe() {
        let dead = isDead() ? "- Mort" : "" // ternary condition
        print("🥋:\(self.name) - ❤️\(self.life) - 🗡\(self.weapon.damage) \(dead)")
              }
}
