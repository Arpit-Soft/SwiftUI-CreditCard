//
//  ContentView.swift
//  SwiftUI-CreditCard
//
//  Created by Arpit Dixit on 31/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var degrees: Double = 0
    @State private var flipped = false
    
    @State private var name = ""
    @State private var expires = ""
    @State private var cvv = ""
    
    var body: some View {
        VStack {
            CreditCard {
                VStack {
                    Group {
                        if flipped {
                            CreditCardBack(cvv: cvv)
                        } else {
                            CreditCardFront(name: name, expires: expires)
                        }
                    }
                }.rotation3DEffect(
                    .degrees(degrees),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            }.onTapGesture {
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
            }
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            
            TextField("Expiration", text: $expires)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            
            TextField("CVV", text: $cvv) { (editingChanged) in
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
            }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
