//
//  ContentView.swift
//  DynamicTypeSample
//
//  Created by Yusuke Hasegawa on 2023/12/07.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appDelegate: AppDelegate
    @State var dynamicTypeSize: DynamicTypeSize = .xSmall
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let sizes: [DynamicTypeSize] = DynamicTypeSize.allCases
    
    var body: some View {
        VStack {
            
            Text("current : \(dynamicTypeSize.description)")
            Text("Aa あ")
                .dynamicTypeSize(dynamicTypeSize)
                .frame(height: 100)
            LazyVGrid(columns: columns) {
                ForEach(sizes.indices, id: \.self) { index in
                    Button(sizes[index].description) {
                        self.dynamicTypeSize = sizes[index]
                    }
                }
            }
        }
        .padding()
        .onReceive(appDelegate.$dynamicTypeSize) { value in
            dynamicTypeSize = value
        }
        .onAppear {
            dynamicTypeSize = appDelegate.dynamicTypeSize
        }
    }
}

extension DynamicTypeSize: CustomStringConvertible {
    public var description: String {
        switch self {
        case .xSmall:
            return "xSmall"
        case .small:
            return "small"
        case .medium:
            return "medium"
        case .large:
            return "large"
        case .xLarge:
            return "xLarge"
        case .xxLarge:
            return "xxLarge"
        case .xxxLarge:
            return "xxxLarge"
        case .accessibility1:
            return "accessibility1"
        case .accessibility2:
            return "accessibility2"
        case .accessibility3:
            return "accessibility3"
        case .accessibility4:
            return "accessibility4"
        case .accessibility5:
            return "accessibility5"
        @unknown default:
            fatalError()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppDelegate())
}
