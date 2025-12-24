//
//  RepositoryListViewModelTests.swift
//  SquareRepos
//
//  Created by Meggi on 22/12/25.
//

import XCTest
@testable import SquareRepos

@MainActor
final class RepositoryListViewModelTests: XCTestCase {

    func testLoadRepositoriesSuccess() async {
        let mockService = MockGitHubService()
        mockService.result = .success([
            Repository(id: 1, name: "TestRepo", description: "Test description")
        ])

        let viewModel = RepositoryListViewModel(service: mockService)
        await viewModel.loadRepositories()

        if case .loaded(let repos) = viewModel.state {
            XCTAssertEqual(repos.count, 1)
        } else {
            XCTFail("Expected loaded state")
        }
    }

    func testLoadRepositoriesFailure() async {
        let mockService = MockGitHubService()
        mockService.result = .failure(URLError(.notConnectedToInternet))

        let viewModel = RepositoryListViewModel(service: mockService)
        await viewModel.loadRepositories()

        if case .error = viewModel.state {
            XCTAssertTrue(true)
        } else {
            XCTFail("Expected error state")
        }
    }
}
