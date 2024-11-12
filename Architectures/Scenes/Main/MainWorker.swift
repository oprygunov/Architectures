//
//  MainWorker.swift
//  Architectures
//
//  Created by Oleg Prygunov on 07.08.2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

final class MainWorker: MainWorkingLogic {
    func fetch(completion: Main.FetchCompletion?) {
        completion?(
            .success(
                .init(
                    items: [
                        .mvp,
                        .mvcApple,
                        .mvcTraditional,
                        .mvvmClosure,
                        .mvvmCombine,
                        .mvvmCoordinator,
                        .viper,
                        .cleanSwift
                    ]
                )
            )
        )
    }
}
