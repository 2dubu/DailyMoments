//
//  DiaryManager.swift
//  DailyMoments
//
//  Created by 이건우 on 10/17/24.
//

import Foundation

struct DiaryEntry: Codable, Equatable {
    let imageUrl: URL?
    let content: String
    let date: Date
}

class DiaryManager {
    static let shared = DiaryManager()
    private let key = "DiaryEntries"
    
    func fetchEntries() -> [DiaryEntry] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let entries = try? JSONDecoder().decode([DiaryEntry].self, from: data) else {
            return []
        }
        return entries
    }

    func saveEntry(imageUrl: URL?, content: String, date: Date) {
        var entries = fetchEntries()
        let newEntry = DiaryEntry(imageUrl: imageUrl, content: content, date: date)
        entries.append(newEntry)

        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func deleteEntry(at index: Int) {
        var entries = fetchEntries()
        entries.remove(at: index)

        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
