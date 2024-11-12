//
//  VIPERRouter.swift
//
//  Created by Oleg Prygunov on 14.08.2022.
//

final class VIPERRouter {
    weak var viewController: VIPERViewController?
}

extension VIPERRouter: VIPERRouterProtocol {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

