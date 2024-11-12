//
//  MVVMCCoordinator.swift
//  Scenes
//
//  Created by Oleg Prygunov on 16.08.2022.
//

final class MVVMCCoordinator: MVVMCCoordinatorProtocol {
    weak var viewController: MVVMCViewController?
    weak var baseCoordinator: BaseCoordinator?

    func close() {
        guard let viewController else { return }
        baseCoordinator?.close(viewController)
    }
}
