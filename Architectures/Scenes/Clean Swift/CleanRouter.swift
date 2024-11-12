//
//  CleanRouter.swift
//  Architectures
//
//  Created by Oleg Prygunov on 20.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import UIKit

final class CleanRouter {
    weak var viewController: CleanViewController?
    let dataStore: CleanDataStore

    // MARK: Initialization
    init(
        viewController: CleanViewController,
        dataStore: CleanDataStore
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: Implementation of Routing methods
extension CleanRouter: CleanRoutingLogic {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
