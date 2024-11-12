//
//  MVVMViewModelProtocol.swift
//
//
//  Created by Oleg Prygunov on 10.08.2022.
//

import Foundation
import Combine

protocol MVVMViewModelProtocol: AnyObject {
    func fetch() -> AnyPublisher<MVVM.RootViewModel?, AppError>
    func reload() -> AnyPublisher<MVVM.RootViewModel, Never>
    func close() -> AnyPublisher<Void, Never>
}

