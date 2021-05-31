//
//  GFError.swift
//  baseFamework
//
//  Created by Tami Yalon on 29/05/2021.
//  Copyright © 2021 Tami yallon. All rights reserved.
//

import Foundation

public enum GFError:String, Error {
    case badURL = "this is bad url, check it!"
    case requestFailed = "the request is failed, please try again later"
    case invalidData = "tha data recived from the server was invalid, please try again"
    case unknown = "unkown error"
}
