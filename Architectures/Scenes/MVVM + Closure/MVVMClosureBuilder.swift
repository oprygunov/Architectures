//
//  MVVMClosureBuilder.swift
//
//
//  Created by Oleg Prygunov on 09.08.2022.
//

import UIKit

final class MVVMClosureBuilder {
    static func build() -> UIViewController {
        let viewController = MVVMClosureViewController()
        let viewModel = MVVMClosureViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}

