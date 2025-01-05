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

//        delayedOptional { name in
//            guard let name else {
//                print("No name")
//                return
//            }
//            self.name = name
//        }
        
//        delayedWithError { result in
//            if result.1 != nil {
//                print("Error: \(result.1!.localizedDescription)")
//                return
//            } else {
//                name = result.0
//            }
//        }
        
        delayedResult { result in
            switch result {
            case .success(let name):
                self.name = name
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
//    func instance() -> String {
//        "Ada"
//    }
    
    
//    func delayed(completion: @escaping (String) -> Void) {
//        delay(2) {
//            completion("Ada")
//        }
//    }
    
    
//    func delayedOptional(completion: @escaping (String?) -> Void) {
//        delay(2) {
//            completion(nil)
//        }
//    }
    
//    func delayedWithError(completion: @escaping ((String, Error?)) -> Void) {
//        delay(2) {
//            completion(("Ada", nil))
//        }
//    }
    
    func delayedResult(completion: @escaping (Result<String, Error>) -> Void) {
        delay(2) {
            completion(.success("Ada"))
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
