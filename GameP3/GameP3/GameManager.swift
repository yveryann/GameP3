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
        
        Bienvenue sur GameP3 ⚔️
""")
        print()
        print("""
        GameP3 est un jeu de combat entre 2 équipes de 3 personnages.
        
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
            var input : String
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
        let characterAttacking = teams[0].selectCharacter()
        let characterDefending = teams[1].selectCharacter()
    }
}
