//
//  ContentView.swift
//  DesignStylishChatUIUsingSwiftUI
//
//  Created by Ramill Ibragimov on 05.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TopView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.top)
            VStack {
                TabView {
                    Home().tabItem {
                        Image(systemName: "message.fill")
                            .font(.title)
                    }
                    Text("Person").tabItem {
                        Image(systemName: "person.fill")
                            .font(.title)
                    }
                }.edgesIgnoringSafeArea(.top)
                .accentColor(Color.gray)
            }
        }
    }
}

struct TopView: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Text("Chats")
                    .fontWeight(.heavy)
                    .font(.system(size: 23))
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "pencil.and.ellipsis.rectangle")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .background(Color.white)
            .padding()
            
            GeometryReader {_ in
                MainView().clipShape(Rounded())
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        List(msgs) {i in
            cellView(pic: i.pic, name: i.name, msg: i.msg, time: i.time, msgs: i.msgs)
        }
    }
}

struct Rounded: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: 55, height: 55))
        return Path(path.cgPath)
    }
}

struct msgType: Identifiable {
    var id: Int
    var msg: String
    var time: String
    var name: String
    var msgs: String
    var pic: String
}

var msgs: [msgType] = [
    msgType(id: 0, msg: "Hi", time: "14:32", name: "Jessica", msgs: "2", pic: "p0"),
    msgType(id: 1, msg: "Hi", time: "14:32", name: "Jessica", msgs: "2", pic: "p0"),
    msgType(id: 2, msg: "Hi", time: "14:32", name: "Jessica", msgs: "2", pic: "p0"),
    msgType(id: 3, msg: "Hi", time: "14:32", name: "Jessica", msgs: "2", pic: "p0"),
    msgType(id: 4, msg: "Hi", time: "14:32", name: "Jessica", msgs: "2", pic: "p0"),
    msgType(id: 5, msg: "Hi", time: "14:32", name: "Jessica", msgs: "2", pic: "p0"),
    msgType(id: 6, msg: "Hi", time: "14:32", name: "Jessica", msgs: "2", pic: "p0"),
    msgType(id: 7, msg: "Hi", time: "14:32", name: "Jessica", msgs: "2", pic: "p0")
]

struct cellView: View {
    var pic: String
    var name: String
    var msg: String
    var time: String
    var msgs: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(pic)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                Text(msg).lineLimit(2)
            }
            Spacer()
            VStack(spacing: 10) {
                Text(time)
                if msgs != "" {
                    Text(msgs)
                        .padding(8)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                } else {
                    Spacer()
                }
            }
        }.padding(9)
    }
}
