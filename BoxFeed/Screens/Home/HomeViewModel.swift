//
//  HomeViewModel.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 07/07/21.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var selection = 0
    @Published var news = [NewsModel]()
    
    @Published var showArticle = false
    @Published var selectedArticle: NewsModel? = nil
    
    init() {
        async { await fetchNews() }
    }
    
    func fetchNews() async {
        let data = await NewsData.getNewsData(Sources.allCases[selection])
        self.news = data
    }
    
    func selectArticle(index: Int) {
        selectedArticle = news[index]
        showArticle = true
    }
}
