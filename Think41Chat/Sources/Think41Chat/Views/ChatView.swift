//
//  ChatView.swift
//  Think41Chat
//
//  Created by Suren on 25/09/26.
//

import SwiftUI
import Foundation

public struct ChatView: View {

    @StateObject private var viewModel: ChatViewModel

    public init(service: ChatService) {
        _viewModel = StateObject(
            wrappedValue: ChatViewModel(service: service)
        )
    }

    public var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding()
                }
                .onChange(of: viewModel.messages) { _ in
                    if let lastMessage = viewModel.messages.last {
                        withAnimation {
                            proxy.scrollTo(
                                lastMessage.id,
                                anchor: .bottom
                            )
                        }
                    }
                }
            }

            MessageInputView(
                text: $viewModel.inputText,
                onSend: viewModel.sendMessage
            )
        }
        .navigationTitle("Chat")
    }
}
