//
//  ContentView.swift
//  Messenger
//
//  Created by Gurudutt on 1/20/20.
//  Copyright © 2020 Gurudutt Perichetla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var name = ""
    
    var body: some View {
       // Text("Hello, World!")
        NavigationView{
            ZStack{
                Color.blue
                VStack{
                    TextField("Name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                    
                    NavigationLink(destination: MsgPage(name:self.name)){
                        HStack{
                            Text("Join")
                        }
                        }.frame(width: 120, height: 120).background(Color.blue).foregroundColor(Color.white).cornerRadius(20)
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

struct MsgPage: View{
    
    var name = ""
    var body : some View{
        Text("hello")
    }
}
