//
//  VIPERBuilder.swift
//
//  Created by Oleg Prygunov on 14.08.2022.
//

import UIKit

final class VIPERBuilder {
    static func build() -> UIViewController {
        let viewController = VIPERViewController()
        let interactor = VIPERInteractor()
        let router = VIPERRouter()
        let presenter = VIPERPresenter()

        viewController.presenter = presenter
        presenter.output = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter
        router.viewController = viewController
        return viewController
    }
}

