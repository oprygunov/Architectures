//
//  MainModels.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

enum Main {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model?
            var error: Error?
        }

        struct ViewModel {
            var root: RootViewModel
            var error: String?
        }
    }

    enum Selected {
        struct Request {
            let index: Int
        }

        struct Response {
            let route: Architecture
        }

        struct ViewModel {
            let route: Architecture
        }
    }

    enum Architecture {
        case mvp
        case mvcApple
        case mvcTraditional
        case mvvmClosure
        case mvvmCombine
        case mvvmCoordinator
        case viper
        case cleanSwift
    }

    struct Model {
        let items: [Architecture]
    }

    struct RootViewModel {
        let items: [String]
    }

    // MARK: Worker completion handler types
    typealias FetchCompletion = (Result<Model, Error>) -> Void
}
