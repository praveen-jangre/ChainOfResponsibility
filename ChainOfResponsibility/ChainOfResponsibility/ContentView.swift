//
//  ContentView.swift
//  ChainOfResponsibility
//
//  Created by Praveen Jangre on 23/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            testChainOfResponsibility()
        }
    }
}

#Preview {
    ContentView()
}
