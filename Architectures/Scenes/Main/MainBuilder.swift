//
//  MainBuilder.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit

public final class MainBuilder {
    public init() { }
    public func build() -> UIViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(
            presenter: presenter,
            worker: MainWorker()
        )
        let router = MainRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
