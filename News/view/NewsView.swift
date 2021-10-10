//
//  NewsView.swift
//  News
//
//  Created by Farkhod on 08.10.2021.
//

import Foundation
import SwiftUI

struct NewsView : View {
    
    let newsHeader: String
    
    var body : some View {
        VStack {
            Text(newsHeader)
//            Spacer()
//            Image("news_logo")
//                .resizable()
//                .frame(width: 128.0, height: 128.0)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(newsHeader: "Mocked News")
    }
}
