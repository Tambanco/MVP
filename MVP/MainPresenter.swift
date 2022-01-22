//
//  MainPresenter.swift
//  MVP
//
//  Created by tambanco 🥳 on 22.01.2022.
//

import Foundation

// MARK: - Output protocol
protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String) // метод отправляет сообщения View
}

// MARK: - Input protocol
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
}
