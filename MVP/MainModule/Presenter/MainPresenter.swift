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
    
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var pasta: [Pasta]?
    
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPasta()
    }
    func getPasta() {
        networkService.getPasta { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let pasta):
                    self.pasta = pasta
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
