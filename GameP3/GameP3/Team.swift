//
//  Team.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Team {
    var teamName: [String]
    var players = [Character]()
    
    
    init(teamName: [String], players: [Character]) {
        self.teamName = teamName
        self.players = players
    }

}


