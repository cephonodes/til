//
//  ContentView.swift
//  Landmarks
//
//  Created by Yuki Narita on 2020/01/29.
//  Copyright © 2020 Yuki. All rights reserved.
//

import SwiftUI

struct ContentView: View {  // Viewというプロトコルで定義されているインターフェースの実装をするということ
    var body: some View {   // some ViewはOpaque Result Type
        VStack {    // returnが省略されている
            // VStackにはViewBuilderが使われているので、以下の様な書き方ができる
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
