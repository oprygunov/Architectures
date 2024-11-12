//
//  MVPBuilder.swift
//  Architectures
//
//  Created by Oleg Prygunov on 08.08.2022.
//

import UIKit

final class MVPBuilder {
    static func build() -> UIViewController {
        let viewController = MVPViewController()
        let presenter = MVPPresenter()
        presenter.view = viewController
        viewController.presenter = presenter
        return viewController
    }
}
