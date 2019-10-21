//
//  GameManager.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class GameManager {
    
    var teams = [Team]()
    
    
    func rules() {
        print("""
        
        ⚔️⚔️⚔️ Bienvenue sur GameP3 ⚔️⚔️⚔️
""")
        print()
        print("""
        GameP3 est un jeu de combat entre 2 équipes de 3 personnages.
        
        Présentation des personnages:
        1. Fighter:     Nombre de points de vie ❤️: 100     Arme: Epée             Dégats provoqués par l'arme 🗡: 10
        2. Colossus:    Nombre de points de vie ❤️: 400     Arme: Lance-Flammes    Dégats provoqués par l'arme 🗡: 5
        3. Wizard:      Nombre de points de vie ❤️: 200     Arme: Onde de Choc     Dégats provoqués par l'arme 🗡: 50
        4. Dwarf:       Nombre de points de vie ❤️: 80     Arme: Hache             Dégats provoqués par l'arme 🗡: 30
        5. Magus:       Nombre de points de vie ❤️: 70     Arme: Baton de Mage     Gains de points de vie lors du soins 💊: 20
        
        Vous aurez le choix à chaque tour pour attaquer (avec un combattant)
        ou de vous soigner (seul le Mage détient ce pouvoir).
        
        Choisissez un combattant et un adversaire.
        Un coffre mystère vous permettra de modifier l'arme de votre combattant.
        L'équipe ayant encore un combattant en vie sera déclaré vainqueur.
        Alors n'attendons plus, au combat soldat !!


""")
        createTeams()
        fight()
    }
    
    func createTeams() {
        var choosenNames = [String]()
        repeat  {
            var input: String
            repeat {
                print("Entrer un nom unique pour l'équipe \(teams.count + 1):")
                input = getStringFromUser()
            } while choosenNames.contains(input.lowercased())
            choosenNames.append(input.lowercased())
            let team = Team(name: input, members: [Character]())
            teams.append(team)
            
        } while teams.count < 2
        
        for team in teams {
            team.createMembers()
        }
        print("==============================================================")
        for team in teams {
            team.description()
            
            print("==============================================================")
        }
    }
    
    func fight() {
        var attackingTeam = teams[0]
        var defendingTeam = teams[1]
        repeat {
            let attacker = attackingTeam.selectCharacter()
            if let magus = attacker as? Magus {
                let target = attackingTeam.selectCharacter()
                magus.care(target)
                print("\(magus.name) a soigné \(target.name) qui a maintenant \(target.life)")
            } else {
                let chest = BonusChest()
                chest.useBonusChest(character: attacker)
                let target = defendingTeam.selectCharacter()
                attacker.attack(target)
                print("\(attacker.name) a attaqué \(target.name) qui a maintenant \(target.life)")
            }
            attackingTeam = attackingTeam === teams[0] ? teams[1] : teams[0]
            defendingTeam = attackingTeam === teams[0] ? teams[1] : teams [0]
            
        } while (attackingTeam.isTeamAlive())
    }
}
