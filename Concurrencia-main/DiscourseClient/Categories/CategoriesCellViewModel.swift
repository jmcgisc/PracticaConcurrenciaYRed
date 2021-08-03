//
//  CategoriesCellViewModel.swift
//  DiscourseClient
//
//  Created by jose manuel carreiro galicia on 24/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

class CategoryCellViewModel {
    let category: Category
    var textLabelText: String?
    
    init(category: Category) {
        self.category = category
        self.textLabelText = category.name
    }
    
}
