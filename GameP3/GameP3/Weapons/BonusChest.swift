//
//  BonusChest.swift
//  GameP3
//
//  Created by Yann Yver on 17/10/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

import Foundation
class BonusChest {
    var bonusWeapon = [
        Weapon(damage: Int.random(in: 1...3), name: "Poignard"),
        Weapon(damage: Int.random(in: 4...6), name: "Frappe de colosse"),
        Weapon(damage: Int.random(in: 6...9), name: "Tempête de lames"),
        Weapon(damage: Int.random(in: 10...15), name: "Eclair")
    ]
    
    func useBonusChest(character: Character) -> Weapon {
        let newWeapon = bonusWeapon.randomElement()
        
            print("""
                                                 🤞🏻  Avec un peu de chance 🤞🏻
                                Le Coffre Mystère peut améliorer les dégâts de votre personnage !!!

                                    ⭐️⭐️⭐️ Souhaitez-vous utiliser le Coffre Mystère ?? ⭐️⭐️⭐️
                               
                                                    1. J'utilise le coffre
                                            2. Je ne souhaite pas utiliser le Coffre

                                    ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️
            """)
        
        let choiceChest = getIntFromUser()
            
        switch choiceChest {
        case 1:
            character.weapon = newWeapon!
            print("\(character.name) vous êtes maintenant équipé de l'arme :\(newWeapon!.name) 🗡: \(newWeapon!.damage)")
            return newWeapon!
        case 2:
            return character.weapon
        default:
            break
        }
        return character.weapon
    }
}
