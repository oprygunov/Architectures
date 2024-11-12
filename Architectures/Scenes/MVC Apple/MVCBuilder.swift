//
//  MVCBuilder.swift
//
//
//  Created by Oleg Prygunov on 07.08.2022.
//

import UIKit

final class MVCBuilder {
    static func build() -> UIViewController {
        let controller = MVCController()
        return controller
    }
}


