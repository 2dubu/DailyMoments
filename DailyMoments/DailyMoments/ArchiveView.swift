//
//  ArchiveView.swift
//  DailyMoments
//
//  Created by 이건우 on 10/17/24.
//

import SwiftUI

struct ArchiveView: View {
    @State private var entries: [DiaryEntry] = []

    var body: some View {
        NavigationView {
            VStack {
                if entries.isEmpty {
                    Text("No diary has been recorded yet.\nTry writing a new diary!")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 40)
                } else {
                    List {
                        ForEach(entries.indices, id: \.self) { index in
                            let entry = entries[index]
                            VStack(alignment: .leading) {
                                HStack(alignment: .top, spacing: 10) {
                                    if let url = entry.imageUrl {
                                        LoadableImageView(imageUrl: url)
                                            .frame(width: 40, height: 40)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(entry.content)
                                            .font(.body)
                                        Text(entry.date, style: .date)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteEntry)
                    }
                    .animation(.easeInOut, value: entries)
                }
            }
            .onAppear {
                entries = DiaryManager.shared.fetchEntries()
            }
            .navigationTitle("Archived")
        }
    }

    // Handle deletion
    private func deleteEntry(at offsets: IndexSet) {
        offsets.forEach { index in
            DiaryManager.shared.deleteEntry(at: index)
        }
        entries = DiaryManager.shared.fetchEntries() // Refresh the list after deletion
    }
}

