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
//        name = instance()
        
//        delayed { name in
//            self.name = name
//        }

        delayedOptional { name in
            guard let name else {
                print("No name")
                return
            }
            self.name = name
        }
    }
    
    func instance() -> String {
        "Ada"
    }
    
    
//    func delayed(completion: @escaping (String) -> Void) {
//        delay(2) {
//            completion("Ada")
//        }
//    }
    
    
    func delayedOptional(completion: @escaping (String?) -> Void) {
        delay(2) {
            completion(nil)
        }
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
