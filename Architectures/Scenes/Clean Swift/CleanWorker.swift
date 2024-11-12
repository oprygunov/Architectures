//
//  CleanWorker.swift
//  Architectures
//
//  Created by Oleg Prygunov on 20.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

import Foundation

final class CleanWorker: CleanWorkingLogic {
    func fetch(completion: Clean.FetchCompletion?) {
        // запрос в сеть
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion?(
                .success(
                    .init(title: "Test Clean Swift", count: 0)
                )
            )
        }
    }
}
