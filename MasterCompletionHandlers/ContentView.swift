//
//  ContentView.swift
//  MasterCompletionHandlers
//
//  Created by Serhii Lukashchuk on 2025-01-04.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = "world"
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            Button("Tap me") {
                buttonTapped()
            }
        }
        .padding()
    }
    
    func buttonTapped() {
        
    }
    
    func delay(_ seconds: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            closure()
        }
    }
}

#Preview {
    ContentView()
}
