//
//  RepositoryListView.swift
//  SquareRepos
//
//  Created by Meggi on 22/12/25.
//

import SwiftUI


struct RepositoryListView: View {
    @StateObject var viewModel = RepositoryListViewModel()

    var body: some View {
        NavigationView {
            content
                .navigationTitle("Square Repos")
        }
        .task {
            await viewModel.loadRepositories()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("Loading repositories...")
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .loaded(let repositories):
            List(repositories) { repo in
                RepositoryRowView(repository: repo)
            }

        case .error(let message):
            VStack(spacing: 16) {
                Text(message)
                    .multilineTextAlignment(.center)

                Button("Retry") {
                    Task {
                        await viewModel.loadRepositories()
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
