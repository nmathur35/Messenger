//
//  ContentView.swift
//  Messenger
//
//  Created by Gurudutt on 1/20/20.
//  Copyright © 2020 Gurudutt Perichetla. All rights reserved.
//

import SwiftUI
import Firebase

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
    
    @ObservedObject var msg = observer()
    @State var typedmsg = ""
    
    var body : some View{
        //Text(name).navigationBarTitle("Chats", displayMode: .large)
        VStack{
        List(msg.msgs){ i in
            Text(i.msg)
        }.navigationBarTitle("Chats", displayMode: .large)
        
            HStack{
                
                TextField("Msg", text: $typedmsg  ).textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    
                }){
                    Text("Send")
                }
            }.padding()
        }
        
    }
}

class observer: ObservableObject{

    @Published var msgs = [datatype]()
    init() {
        let db = Firestore.firestore()
        db.collection("msgs").addSnapshotListener{
            (snap, err)  in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                if i.type == .added{
                    let name = i.document.get("name") as! String
                    let msg = i.document.get("msg") as! String
                    let id = i.document.documentID
                    
                    self.msgs.append(datatype(id: id, name: name, msg: msg))
                    
                }
            }
        }
    }
    
}

struct datatype: Identifiable{
    var id: String
    var name: String
    var msg: String
    
}
