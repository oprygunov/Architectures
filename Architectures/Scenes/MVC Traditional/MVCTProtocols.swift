//
//  File.swift
//  
//
//  Created by Oleg Prygunov on 07.08.2022.
//

import Foundation

protocol MVCTViewDelegate: AnyObject {
    func didPressReload()
    func didPressClose()
}
