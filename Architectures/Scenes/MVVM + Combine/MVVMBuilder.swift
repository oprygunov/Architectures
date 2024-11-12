//
//  MVVMBuilder.swift
//
//
//  Created by Oleg Prygunov on 10.08.2022.
//

import UIKit

final class MVVMBuilder {
    static func build() -> UIViewController {
        let viewController = MVVMViewController()
        let viewModel = MVVMViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}

