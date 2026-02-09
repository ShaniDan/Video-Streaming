//
//  Main.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/9/26.
//

import SwiftUI

struct Main: View {
    
    @StateObject var vm = VideoViewModel()
    
    var body: some View {
        VStack {
            ForEach(vm.videos, id: \.url) { item in
                Text(item.title)
            }
        }
    }
}

#Preview {
    Main()
}
