//
//  CreditCard.swift
//  SwiftUI-CreditCard
//
//  Created by Arpit Dixit on 31/08/21.
//

import SwiftUI

struct CreditCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct CreditCardFront: View {
    
    var name: String
    var expires: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
                Spacer()
                Text("VISA")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Text("**** **** **** 2648")
                .foregroundColor(.white)
                .font(.system(size: 32))
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("CARD HOLDER")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Text(name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("EXPIRES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Text(expires)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            
        }.frame(width: 300, height: 200, alignment: .center)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4714665292, green: 0.1133600839, blue: 0.3285673325, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10.0)
    }
}

struct CreditCardBack: View {
    
    var cvv: String
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding([.top])
            Spacer()
            HStack {
                Text(cvv)
                    .foregroundColor(.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .padding(5)
                    .frame(width: 100, height: 20, alignment: .center)
                    .background(Color.white)
                Spacer()
            }.padding()
        }.frame(width: 300, height: 200, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4714665292, green: 0.1133600839, blue: 0.3285673325, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10.0)
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard<CreditCardFront>(content: { CreditCardFront(name: "ARPIT DIXIT", expires: "12/50") })
    }
}
