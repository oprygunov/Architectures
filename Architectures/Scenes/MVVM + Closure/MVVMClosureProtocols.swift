//
//  MVVMClosureProtocols.swift
//
//
//  Created by Oleg Prygunov on 09.08.2022.
//

import Foundation
import Combine

protocol MVVMClosureViewModelProtocol: AnyObject {
    func fetch(_ completion: @escaping (Result<MVVMClosure.RootViewModel?, AppError>) -> Void)
    func reload(_ completion: (Result<MVVMClosure.RootViewModel, AppError>) -> Void)
    func close(_ completion: () -> Void)
}

