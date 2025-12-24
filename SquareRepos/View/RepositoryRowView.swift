//
//  RepositoryRowView.swift
//  SquareRepos
//
//  Created by Meggi on 22/12/25.
//

import SwiftUI

struct RepositoryRowView: View {
    let repository: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(repository.name)
                .font(.headline)

            if let description = repository.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } else {
                Text("No description available.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .italic()
            }
        }
        .padding(.vertical, 8)
    }
}
