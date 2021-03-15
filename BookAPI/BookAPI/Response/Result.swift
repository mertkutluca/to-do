//
//  Result.swift
//  BookAPI
//
//  Created by mert.kutluca on 15.03.2021.
//

import Foundation

public enum Result<Element> {
    case success(Element)
    case fail(Error)
}
