//
//  BonusChest.swift
//  GameP3
//
//  Created by Yann Yver on 17/10/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

import Foundation
class BonusChest {
    var bonusWeapon = [ // weapon board for the bonus chest with random damage
        Weapon(damage: Int.random(in: 5...10), name: "Poignard"),
        Weapon(damage: Int.random(in: 10...20), name: "Frappe de colosse"),
        Weapon(damage: Int.random(in: 30...60), name: "Tempête de lames"),
        Weapon(damage: Int.random(in: 50...90), name: "Eclair")
    ]
    
    func bonusChest(character: Character) {
        let newWeapon = bonusWeapon.randomElement() // instance for random use of chest weapons
        
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
            if let newsWeapon = newWeapon { // if choice 1 validated by user use of the safe and display of new features
            character.weapon = newsWeapon
            print("\(character.name) vous êtes maintenant équipé de l'arme :\(newsWeapon.name) - dégâts🗡: \(newsWeapon.damage)")
            }
        default:
            break
            }
        }
    
    func useBonus(character: Character) { // function to display the output of the safe every 80% of the time
        let random = Int.random(in: 1...10)
        if random > 8 {
            print("Bravo vous avez découvert un coffre !")
            bonusChest(character: character)
        }
    }

    
}
