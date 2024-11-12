//
//  MainProtocols.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

/// Main interactor protocol
protocol MainBusinessLogic: AnyObject {
    func request(_ request: Main.Fetch.Request)
    func request(_ request: Main.Selected.Request)
}

/// Main presenter protocol
protocol MainPresentingLogic: AnyObject {
    func present(_ response: Main.Fetch.Response)
    func present(_ response: Main.Selected.Response)
}

/// Main view protocol
protocol MainDisplayLogic: AnyObject {
    func display(_ viewModel: Main.Fetch.ViewModel)
    func display(_ viewModel: Main.Selected.ViewModel)
}

/// Main router protocol
protocol MainRoutingLogic: AnyObject {
    func showMVP()
    func showMVCApple()
    func showMVCTraditional()
    func showMVVMClosure()
    func showMVVMCombine()
    func showMVVMCoordinator()
    func showVIPER()
    func showCleanSwift()
}

/// Main data store protocol to pass data between scenes
protocol MainDataStore: AnyObject {}

/// Main worker protocol
protocol MainWorkingLogic: AnyObject {
    func fetch(completion: Main.FetchCompletion?)
}
