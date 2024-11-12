//
//  CleanModels.swift
//  Architectures
//
//  Created by Oleg Prygunov on 20.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

enum Clean {
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

    enum Reload {
        struct Request {}

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: RootViewModel
        }
    }

    enum Close {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    struct Model {
        var title: String
        var count: Int
    }

    struct RootViewModel {
        var title: String
        var count: String
    }

    // MARK: Worker completion handler types
    typealias FetchCompletion = (Result<Model, AppError>) -> Void
}
