//
//  MVVMCBuilder.swift
//
//
//  Created by Oleg Prygunov on 16.08.2022.
//

import UIKit

final class MVVMCBuilder {
    static func build(baseCoordinator: BaseCoordinator) -> UIViewController {
        let viewController = MVVMCViewController()
        let viewModel = MVVMCViewModel()
        let coordinator = MVVMCCoordinator()
        coordinator.viewController = viewController
        coordinator.baseCoordinator = baseCoordinator
        viewController.viewModel = viewModel
        viewController.coordinator = coordinator
        return viewController
    }
}

