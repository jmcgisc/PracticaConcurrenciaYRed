//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

protocol CategoriesViewDelegate: AnyObject {
    func categoriesFetched()
    func errorFetchingCategories()
}

/// ViewModel representando un listado de categorías
class CategoriesViewModel {
    weak var viewDelegate: CategoriesViewDelegate?
    let categoriesDataManager: CategoriesDataManager
    var categoriesViewModels: [CategoryCellViewModel] = []
    
    init(categoriesDataManager: CategoriesDataManager) {
        self.categoriesDataManager = categoriesDataManager
    }
    
    
    func viewWasLoaded () {
        fetchCategories()
        
    }
    
    func fetchCategories () {
        categoriesDataManager.fetchAllCategories { [weak self] result in
            guard let self = self else {return}
            
            switch result {
                case.success(let categoriesResponse):
                    guard let unwrappedCategories = categoriesResponse?.categoryList.categories else {return}
                    
                    self.categoriesViewModels = unwrappedCategories.map({ category -> CategoryCellViewModel in
                        return CategoryCellViewModel(category: category)
                    })
                    
                    self.viewDelegate?.categoriesFetched()
                    
                case.failure(let error):
                    print(error)
                    self.viewDelegate?.errorFetchingCategories()
            }
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return categoriesViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < categoriesViewModels.count else { return nil }
        return categoriesViewModels[indexPath.row]
    }
}



    
    


