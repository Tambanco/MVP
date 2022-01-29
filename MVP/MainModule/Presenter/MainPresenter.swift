//
//  MainPresenter.swift
//  MVP
//
//  Created by tambanco 🥳 on 22.01.2022.
//

import Foundation

// MARK: - Output protocol
protocol MainViewProtocol: AnyObject {
    func success()
    func failure()
}

// MARK: - Input protocol
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
}

class MainPresenter: MainViewPresenterProtocol {
    
    let view: MainViewProtocol
    let networkService: NetworkServiceProtocol
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
}
