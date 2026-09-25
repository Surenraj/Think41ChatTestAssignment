//
//  MessageBubble.swift
//  Think41Chat
//
//  Created by Suren on 25/09/26.
//

import SwiftUI

struct MessageBubble: View {

    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }

            Text(message.text)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(
                    message.isUser
                    ? Color.blue
                    : Color.gray.opacity(0.2)
                )
                .foregroundStyle(
                    message.isUser
                    ? .white
                    : .primary
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )

            if !message.isUser {
                Spacer()
            }
        }
    }
}
