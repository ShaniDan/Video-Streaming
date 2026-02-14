//
//  Sample.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/12/26.
//

import SwiftUI

struct Sample1: View {
    var body: some View {
        VStack {
            Grid() {
                GridRow {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                GridRow {
                    Text("Item 4")
                    Text("Item 5")
                        .gridCellColumns(2)
                }
            }
        }
        
//        VStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
//        .onAppear(perform: {
//                print(Bundle.main.infoDictionary?["API_KEY"] as? String ?? "Can't find api key")
//            })
    }
}

#Preview {
    Sample1()
}
