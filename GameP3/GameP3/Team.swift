//
//  Team.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Team {
    var name: String
    var members = [Character]()
    
    
    init(name: String, members: [Character]) {
        self.name = name
        self.members = members
    }
    // fonction pour la création des personnages dans l'équipe
    func createMembers()  {
        print()
        print("Equipe \(name) :")
        // boucle permettant de créer 3 personnages
        for index in 1...3 {
            var input: String
            var choiceUserOne = Int()
            repeat {
               // affichage des personnages et de leurs spécificité
                print("""
                    Choix personnage \(index) :")
                    1. Fighter:     ❤️ 50  🗡 10
                    2. Colossus:    ❤️ 90  🗡 5
                    3. Wizard:      ❤️ 80  🗡 50
                    4. Dwarf:       ❤️ 40   🗡 30
                    5. Magus:       ❤️ 30   💊 20
                    """)
                choiceUserOne = getIntFromUser()
            } // tant que le choix n'est pas entre 1 et 5
                while choiceUserOne != 1 && choiceUserOne != 2 && choiceUserOne != 3 && choiceUserOne != 4 && choiceUserOne != 5
            
            repeat {
                // choix du nom unique pour le personnage
                print("Entrer un nom unique de votre personnage\(index):")
                input = getStringFromUser()
            } // tant que l'unicité du nom n'est pas vérifié
                while Character.isAlreadyExistingName(input)
            // enregistrer le personnage dans le tableau avec son nom unique
            var warrior: Character
            switch choiceUserOne {
            case 1:
                warrior = Fighter(name: input)
                self.members.append(warrior)
            case 2:
                warrior = Colossus(name: input)
                self.members.append(warrior)
            case 3:
                warrior = Wizard(name: input)
                self.members.append(warrior)
            case 4:
                warrior = Dwarf(name: input)
                self.members.append(warrior)
            case 5:
                warrior = Magus(name: input)
                self.members.append(warrior)
            default: //
                print("Erreur je n'ai pas compris votre choix")
                break
            }
        }
    }
    
    func description() {
        // description de l'équipe et des personnages avec leur numéro dans le tableau
        print("\(self.name) voici les personnages de votre équipe: ")
        for (index,character) in members.enumerated() {
            print("\(index + 1) - \(character.describe())")
        }
    }
    
    func selectCharacter() -> Character {
        print("Selectionner un personnage vivant dans la liste suivante: ")
        description()
        let choice = getIntFromUser() - 1
        if choice >= 0 && choice <= members.count {
            if !members[choice].isDead() {
                return members[choice]
            }else {
                print("Ce personnage est mort")
            }
        }
        print("Erreur, selectionner un chiffre de 1 à \(members.count) vivant")
        return selectCharacter()
    }
    
    func isTeamAlive() -> Bool {
        for character in members {
            if !character.isDead() {
                return true
            }
        }
        return false
    }
    
}
