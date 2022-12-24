//
//  ArticleViewModel.swift
//  NewsMVVM
//
//  Created by nuri on 23/12/22.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleViewModel {
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: Observable<String>{
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}


struct ArticleListViewModel{
    let articlesViewModel: [ArticleViewModel]
}


extension ArticleListViewModel{
    init(articles: [Article]) {
        self.articlesViewModel = articles.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    func articleAt(index: Int) -> ArticleViewModel {
        return self.articlesViewModel[index]
    }
}

