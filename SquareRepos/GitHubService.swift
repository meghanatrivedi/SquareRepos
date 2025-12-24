//
//  GitHubService.swift
//  SquareRepos
//
//  Created by Meggi on 22/12/25.
//

import Foundation

protocol GitHubServiceProtocol {
    func fetchRepositories() async throws -> [Repository]
}

final class GitHubService: GitHubServiceProtocol {
    private let urlString = "https://api.github.com/orgs/square/repos"

    func fetchRepositories() async throws -> [Repository] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode([Repository].self, from: data)
    }
}
