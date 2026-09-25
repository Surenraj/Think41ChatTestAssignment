//
//  ContentView.swift
//  Think41ChatDemo
//
//  Created by Suren on 24/09/26.
//

import SwiftUI
import Think41Chat

struct ContentView: View {

    var body: some View {
        NavigationStack {
            ChatView(
                service: MockChatService()
            )
        }
    }
}

#Preview {
    ContentView()
}
