//
//  MVCProtocols.swift
//  
//
//  Created by Oleg Prygunov on 07.08.2022.
//

import Foundation

protocol MVCControllerProtocol: AnyObject {
    func fetch()
    func close()
    func reload()
}

