//
//  Team.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Team {
    var teamName: String
    var players = [Character]()
    
    
    init(teamName: String, players: [Character]) {
        self.teamName = teamName
        self.players = players
    }
    
    func resumeOfFight(teamCible1: Team, teamCible2: Team, characterCible1: Character, characterCible2: Character ) {
        print("Vainqueur du combat: \(teamCible1.teamName)")
        print("Combattant:\(characterCible1.name),Points de vie:\(characterCible1.life)")
        print()
        print("Perdant du combat:\(teamCible2.teamName)")
        print("Combattant:\(characterCible2.name), Points de vie:\(characterCible2.life)")
    }
    
    
    
}
