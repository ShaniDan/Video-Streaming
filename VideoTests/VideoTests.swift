//
//  VideoTests.swift
//  VideoTests
//
//  Created by Shakhnoza Mirabzalova on 2/7/26.
//

import Testing
import AVKit

struct VideoTests {

    @Test func example() async throws {
        let avPlayer1 = AVPlayer()
        let avPlayer2 = avPlayer1
        
        #expect(avPlayer1 == avPlayer2)
        
    }

}
