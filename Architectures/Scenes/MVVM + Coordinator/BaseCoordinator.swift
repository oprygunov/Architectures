//
//  BaseCoordinator.swift
//  Scenes
//
//  Created by Oleg Prygunov on 16.08.2022.
//

import UIKit

public class Coordinator {
    static var shared = Coordinator()
    var base: BaseCoordinator?
}

public class BaseCoordinator: BaseCoordinatorProtocol {
    public var navigationController: UINavigationController

    public init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }

    public func close(_ viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}

public protocol BaseCoordinatorProtocol: AnyObject {
    var navigationController : UINavigationController { get set }
    func close(_ viewController: UIViewController)
}
