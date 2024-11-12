//
//  CleanProtocols.swift
//  Architectures
//
//  Created by Oleg Prygunov on 20.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

/// Clean interactor protocol
protocol CleanBusinessLogic: AnyObject {
    func request(_ request: Clean.Fetch.Request)
    func request(_ request: Clean.Reload.Request)
    func request(_ request: Clean.Close.Request)
}

/// Clean presenter protocol
protocol CleanPresentingLogic: AnyObject {
    func present(_ response: Clean.Fetch.Response)
    func present(_ response: Clean.Reload.Response)
    func present(_ response: Clean.Close.Response)
}

/// Clean view protocol
protocol CleanDisplayLogic: AnyObject {
    func display(_ viewModel: Clean.Fetch.ViewModel)
    func display(_ viewModel: Clean.Reload.ViewModel)
    func display(_ viewModel: Clean.Close.ViewModel)
}

/// Clean router protocol
protocol CleanRoutingLogic: AnyObject {
    func close()
}

/// Clean data store protocol to pass data between scenes
protocol CleanDataStore: AnyObject {}

/// Clean worker protocol
protocol CleanWorkingLogic: AnyObject {
    func fetch(completion: Clean.FetchCompletion?)
}
