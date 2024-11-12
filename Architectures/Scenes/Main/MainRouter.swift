//
//  MainRouter.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit

final class MainRouter {
    weak var viewController: MainViewController?
    let dataStore: MainDataStore

    // MARK: Initialization
    init(
        viewController: MainViewController,
        dataStore: MainDataStore
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: Implementation of Routing methods
extension MainRouter: MainRoutingLogic {
    func showMVP() {
        viewController?.navigationController?.pushViewController(MVPBuilder.build(), animated: true)
    }
    
    func showMVCApple() {
        viewController?.navigationController?.pushViewController(MVCBuilder.build(), animated: true)
    }
    
    func showMVCTraditional() {
        viewController?.navigationController?.pushViewController(MVCTBuilder.build(), animated: true)
    }
    
    func showMVVMClosure() {
        viewController?.navigationController?.pushViewController(MVVMClosureBuilder.build(), animated: true)
    }
    
    func showMVVMCombine() {
        viewController?.navigationController?.pushViewController(MVVMBuilder.build(), animated: true)

    }
    
    func showMVVMCoordinator() {
        guard let coordinator = Coordinator.shared.base else { return }
        viewController?.navigationController?.pushViewController(MVVMCBuilder.build(baseCoordinator: coordinator), animated: true)
    }
    
    func showVIPER() {
        viewController?.navigationController?.pushViewController(VIPERBuilder.build(), animated: true)
    }
    
    func showCleanSwift() {
        viewController?.navigationController?.pushViewController(CleanBuilder().build(), animated: true)
    }
}
