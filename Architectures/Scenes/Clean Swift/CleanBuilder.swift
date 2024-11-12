//
//  CleanBuilder.swift
//  Architectures
//
//  Created by Oleg Prygunov on 20.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit

final class CleanBuilder {
    func build() -> UIViewController {
        let viewController = CleanViewController()
        let presenter = CleanPresenter(view: viewController)
        let interactor = CleanInteractor(
            presenter: presenter,
            worker: CleanWorker()
        )
        let router = CleanRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
