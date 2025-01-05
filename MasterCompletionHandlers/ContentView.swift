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
        Task {
            do {
                name = try await delayedResult()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func delayedResult(completion: @escaping (Result<String, Error>) -> Void) {
        delay(2) {
            completion(.success("Ada"))
        }
    }
    
    func delayedResult() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            delayedResult { result in
                continuation.resume(with: result)
            }
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
