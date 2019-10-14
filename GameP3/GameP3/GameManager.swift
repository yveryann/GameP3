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
        var input: Int
        
        print("Equipe \(teams[0]) combat ou soins, faites votre choix:)")
        teams[0].selectCharacter()
        
        while !teams[0].members[input].isDead() && !teams[1].members[input].isDead() {
            
            if teams[0].members[input] is Magus {
                teams[0].selectCharacter()
                teams[0].Magus.care(teams[0].members[input])// I don't know how to acces the care function
                
            } else {
                teams[1].selectCharacter()
                teams[0].members[input].attack(characterCible: teams[1].members[input])
            }
            for team in teams {
                team.description()
            }
        } return winner()
        
        print("Equipe \(teams[1]) combat ou soins, faites votre choix:")
        teams[1].selectCharacter()
        
        while !teams[1].members[input].isDead() && !teams[1].members[input].isDead() {
            
            if teams[1].members[input] is Magus {
                teams[1].selectCharacter()
                teams[1].Magus.care(teams[1].members[input])// I don't know how to acces the care function
            } else {
                teams[0].selectCharacter()
                teams[1].members[input].attack(characterCible: teams[0].members[input])
            }
            for team in teams {
                team.description()
            }
        } return winner()
    }
}
