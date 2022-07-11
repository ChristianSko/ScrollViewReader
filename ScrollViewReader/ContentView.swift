//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by Christian Skorobogatow on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var scrollToIndex: Int = 0
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .padding(.leading)
                .border(.black)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            ScrollView {
                ScrollViewReader { proxy in
                    
                    Button("SCROLL NOW") {
                            if let index = Int(textFieldText) {
                                scrollToIndex = index
                            }
                    }
                    
                    ForEach(0..<50) {index in
                        Text("This is item # \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
