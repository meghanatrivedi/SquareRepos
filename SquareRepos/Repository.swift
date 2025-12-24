//
//  Repository.swift
//  SquareRepos
//
//  Created by Meggi on 22/12/25.
//

import Foundation

struct Repository: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
}
