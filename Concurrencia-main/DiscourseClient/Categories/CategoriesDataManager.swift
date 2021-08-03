//
//  CategoriesDataManager.swift
//  DiscourseClient
//
//  Created by jose manuel carreiro galicia on 24/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

enum CategoriesDataManagerError: Error {
    case unknown
}

protocol CategoriesDataManager {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ())
}

