//
//  Algos.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/24/26.
//

import Foundation
import Algorithms

var numbers = [10, 20, 30, 10, 40, 40, 10, 20]
let chunks = numbers.chunked(by: {$0 <= $1 })
