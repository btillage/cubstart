//
//  Article.swift
//  newsfeedSkeleton
//
//  Created by Berry Tillage on 4/5/22.
//


import Foundation

// MARK: - Feed
struct ArticleResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    
    let id: UUID = UUID()
    var author: String?
    var url: String?    
    var source, title: String?
    var articleDescription: String?
    var image: String?
    var date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title, image, date
        case articleDescription = "description"
    }
}

