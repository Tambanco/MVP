//
//  ModuleBuilder.swift
//  MVP
//
//  Created by tambanco 🥳 on 22.01.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
