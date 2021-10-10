//
//  NewsContentViewModel.swift
//  News
//
//  Created by Farkhod on 08.10.2021.
//

import Foundation

final class NewsContentViewModel : ObservableObject {
    @Published var newsList: [NewsData] = []
    @Published var isLoading = false
    
    func getNewsList() {
        isLoading = true
//        self.newsList = [NewsData(id: 0, author: "author", title: "title", description: "description", url:"url"), NewsData(id: 1, author: "author", title: "title", description: "description", url:"url"), NewsData(id: 2, author: "author", title: "title", description: "description", url:"url"), NewsData(id: 3, author: "author", title: "title", description: "description", url:"url")]
//
        NetworkManager.shared.getNews{ [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let newsData):self.newsList = newsData
                case .failure(let error): break
                }
            }
        }
    }
}
