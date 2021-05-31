//
//  Constants.swift
//  baseFamework
//
//  Created by Tami Yalon on 29/05/2021.
//  Copyright © 2021 Tami yallon. All rights reserved.
//

import Foundation


/*
 Note: Please use this URL (http://www.mocky.io/v2/5e0af46b3300007e1120a7ef) in order to test your redirect feature.
 http://www.mocky.io/v2/5e0af46b3300007e1120a7ef
 301 Moved Permanently
 http://www.mocky.io/v2/5e0af421330000250020a7eb
 301 Moved Permanently
 http://www.mocky.io/v2/5e0af415330000540020a7ea
 301 Moved Permanently
 http://www.mocky.io/v2/5e0af3ff3300005f0020a7e7
 301 Moved Permanently
 https://www.mocky.io/v2/5185415ba171ea3a00704eed
 200 OK
 */

public enum ApiPath: String {
    case baseUrl = "http://www.mocky.io/v2/"
    case mock1 = "5e0af46b3300007e1120a7ef"
    case mock2 = "5e0af421330000250020a7eb"
    case mock3 = "5e0af415330000540020a7ea"
    case mock4 = "5e0af3ff3300005f0020a7e7"
    case mock5 = "5185415ba171ea3a00704eed"
}
