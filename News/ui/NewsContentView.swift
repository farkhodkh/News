//
//  ContentView.swift
//  News
//
//  Created by Farkhod on 08.10.2021.
//

import SwiftUI

struct NewsContentView: View {
    
    @StateObject private var viewModel = NewsContentViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(viewModel.newsList, id: \.id) {  newsData in
                    NewsView(newsHeader: newsData.title)
                }
                .navigationTitle("😁 News")
            }
            .onAppear{viewModel.getNewsList()}
        }
    }
}

struct NewsContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsContentView()
    }
}
