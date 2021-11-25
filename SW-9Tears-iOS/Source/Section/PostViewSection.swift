//
//  PostViewSection.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import RxDataSources

enum PostViewSection {
    case post([PostViewSectionItem])
}

extension PostViewSection: SectionModelType {
    typealias Item = PostViewSectionItem
    
    var items: [PostViewSectionItem] {
        switch self {
        case let .post(items):
            return items
        }
    }
    
    init(original: PostViewSection, items: [PostViewSectionItem]) {
        switch original {
        case let .post(items):
            self = .post(items)
        }
    }
}

enum PostViewSectionItem {
    case post(PostListCellReactor)
}
