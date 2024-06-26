//
//  Mission.swift
//  Moonshot
//
//  Created by Dillon Teakell on 5/21/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String
    let crew: [CrewRole]
    let description: String
}
