//
//  MockGitHubService.swift
//  SquareRepos
//
//  Created by Meggi on 22/12/25.
//

import Foundation
@testable import SquareRepos

final class MockGitHubService: GitHubServiceProtocol {
    var result: Result<[Repository], Error> = .success([])

    func fetchRepositories() async throws -> [Repository] {
        switch result {
        case .success(let repos):
            return repos
        case .failure(let error):
            throw error
        }
    }
}
