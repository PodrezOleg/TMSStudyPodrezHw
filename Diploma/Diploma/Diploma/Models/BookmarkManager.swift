//
//  BookmarkManager.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import Foundation

class BookmarkManager {
    static let shared = BookmarkManager()
    private let defaults = UserDefaults.standard
    private let key = "Bookmarks"

    private init() {}

    func loadBookmarks() -> [String] {
        return defaults.stringArray(forKey: key) ?? []
    }

    func saveBookmark(url: String) {
        var bookmarks = loadBookmarks()
        if !bookmarks.contains(url) {
            bookmarks.append(url)
            defaults.set(bookmarks, forKey: key)
        }
    }

    func removeBookmark(url: String) {
        var bookmarks = loadBookmarks()
        bookmarks.removeAll { $0 == url }
        defaults.set(bookmarks, forKey: key)
    }
}
