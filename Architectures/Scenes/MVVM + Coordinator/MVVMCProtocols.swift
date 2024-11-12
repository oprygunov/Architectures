//
//  MVVMCProtocols.swift
//
//
//  Created by Oleg Prygunov on 16.08.2022.
//

import Foundation
import Combine

protocol MVVMCViewModelProtocol: AnyObject {
    func fetch(_ completion: @escaping (Result<MVVMC.RootViewModel?, AppError>) -> Void)
    func reload(_ completion: (Result<MVVMC.RootViewModel, AppError>) -> Void)
    func close(_ completion: () -> Void)
}

protocol MVVMCCoordinatorProtocol {
    func close()
}

