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
    func failure(error: Error)
}

// MARK: - Input protocol
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getPasta()
    var pasta: [Pasta]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    
    let view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var pasta: [Pasta]?
    
    func getPasta() {
        networkService.getPasta { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pasta):
                self.pasta = pasta
                self.view?.success()
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPasta()
    }
}
