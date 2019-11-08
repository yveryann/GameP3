//
//  GameManager.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class GameManager {
    var teams = [Team]() // Create a teams instance for the teams table
    var rounds = 0
    
    func rules() { // start the game by the rules
        print("""
        
        ⚔️⚔️⚔️ Bienvenue sur GameP3 ⚔️⚔️⚔️
""")
        print()
        print("""
        GameP3 est un jeu de combat entre 2 équipes de 3 personnages.
        
        Présentation des personnages:
        1. Fighter:     Nombre de points de vie ❤️: 50     Arme: Epée              Dégats provoqués par l'arme 🗡: 10
        2. Colossus:    Nombre de points de vie ❤️: 90     Arme: Lance-Flammes     Dégats provoqués par l'arme 🗡: 5
        3. Wizard:      Nombre de points de vie ❤️: 80     Arme: Onde de Choc      Dégats provoqués par l'arme 🗡: 50
        4. Dwarf:       Nombre de points de vie ❤️: 40     Arme: Hache             Dégats provoqués par l'arme 🗡: 30
        5. Magus:       Nombre de points de vie ❤️: 30     Arme: Baton de Mage     Gains de points de vie lors du soins 💊: 20
        
        Vous aurez le choix à chaque tour pour attaquer (avec un combattant)
        ou de vous soigner (seul le Mage détient ce pouvoir).
        
        Choisissez un combattant et un adversaire.
        Un coffre mystère vous permettra de modifier l'arme de votre combattant.
        L'équipe ayant encore un combattant en vie sera déclaré vainqueur.
        Alors n'attendons plus, au combat soldat !!


""")
        
        createTeams() // function for creating 2 teams with a unique name
        
        fight() // function for combat
    }
    
    func createTeams() {
        var choosenNames = [String]() // unique name table of the teams
        repeat  {
            var input: String
            repeat {
                print("Entrer un nom unique pour l'équipe \(teams.count + 1):")
                input = getStringFromUser()
            } while choosenNames.contains(input.lowercased()) // the name is not unique
            choosenNames.append(input.lowercased())
            let team = Team(name: input, members: [Character]())
            teams.append(team)
            
        } while teams.count < 2 // as long as the team table does not contain the 2 teams
        
        for team in teams { // loop for creating characters in teams
            team.createMembers()
        }
        print("==============================================================")
        
        for team in teams { // loop for the description of the characters of the teams
            team.description()
            
            print("==============================================================")
        }
    }
    
    func fight() {
        var attackingTeam = teams[0] // instance of the team that will start attacking
        var defendingTeam = teams[1] // instance of the team that will start defending
        repeat {
            let attacker = attackingTeam.selectCharacter() // selection of the character who will attack
            if let magus = attacker as? Magus { // verification and type assignment for the Mage
                let target = attackingTeam.selectCharacter() // selection of the character to be healed in the same team
                magus.care(target) // utiliser la fonction soigner
                print("\(magus.name) a soigné \(target.name) qui a maintenant \(target.life) points de vie.") // display of the result of the care performed
            } else {
                print("==============================================================")
                let chest = BonusChest() // create instance for bonus chest
                chest.bonusChest(character: attacker) // use of the bonus chest
                let target = defendingTeam.selectCharacter() // selection of the character to attack
                attacker.attack(target) // utiliser fonction attack
                print("\(attacker.name) a attaqué \(target.name) qui a maintenant \(target.life) points de vie.") // show the result of the fight
                print("==============================================================")
            }
            rounds += 1
            attackingTeam = attackingTeam === teams[0] ? teams[1] : teams[0] // ternary condition to reverse defender attacking roles
            defendingTeam = attackingTeam === teams[0] ? teams[1] : teams[0] // ternary condition to reverse defender attacking roles
            
        } while (attackingTeam.isTeamAlive()) && (attackingTeam.hasOnlyMagus()) && (defendingTeam.hasOnlyMagus())// as long as the attacking team to a player alive
        congratsWinner(for: defendingTeam) // display of the winner
        print()
        print("=========================================")
        stat(0) // display game statistics
        print("==========================================")
        stat(1) // display game statistics
    }
    
    func congratsWinner(for player: Team) {
        print("""
                                    ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️
                                👏👏 Félicitattions équipe \(player.name) vous êtes le vainqueur du combat. 👏👏
            
                                                                ☠️☠️☠️☠️☠️
            
                                                MERCI D'AVOIR JOUE A CET INCROYABLE COMBAT.
            """)
    }
    
    
    func stat(_ index:Int) {
        
        print("""
            La partie s'est fini en \(rounds) tour de jeu.
            
            
            
            Le personnage \(teams[index].members[0].name):
            - \(teams[index].members[0].describe())
            - \(teams[index].members[0].statsOfFights) combats.
            - \(teams[index].members[0].numberDamage) dégâts infligés.
            - \(teams[index].members[0].life - teams[index].members[0].lifeStart) pts de vie.
            
            Le personnage \(teams[index].members[1].name):
            - \(teams[index].members[1].describe())
            - \(teams[index].members[1].statsOfFights) combats.
            - \(teams[index].members[1].numberDamage) dégâts infligés.
            - \(teams[index].members[1].life - teams[index].members[1].lifeStart) pts de vie.
            
            Le personnage \(teams[index].members[2].name):
            - \(teams[index].members[2].describe())
            - \(teams[index].members[2].statsOfFights) combats.
            - \(teams[index].members[2].numberDamage) dégâts infligés.
            - \(teams[index].members[2].life - teams[index].members[2].lifeStart) pts de vie.
            
            """)
    }
    
    
    
    
}
