//
//  RepositoryListViewModel.swift
//  SquareRepos
//
//  Created by Meggi on 22/12/25.
//

import Foundation
import Combine

@MainActor
final class RepositoryListViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case loaded([Repository])
        case error(String)
    }

    @Published private(set) var state: State = .idle

    private let service: GitHubServiceProtocol

    init(service: GitHubServiceProtocol = GitHubService()) {
        self.service = service
    }

    func loadRepositories() async {
        state = .loading
        do {
            let repos = try await service.fetchRepositories()
            state = .loaded(repos)
        } catch {
            state = .error("Failed to load repositories.\n\(error.localizedDescription)")
        }
    }
}
