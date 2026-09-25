//
//  MessageInputView.swift
//  Think41Chat
//
//  Created by Suren on 25/09/26.
//


import SwiftUI

struct MessageInputView: View {

    @Binding var text: String

    let onSend: () -> Void

    var body: some View {
        HStack(spacing: 8) {

            TextField(
                "Message",
                text: $text
            )
            .textFieldStyle(.roundedBorder)

            Button {
                onSend()
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.title2)
            }
            .disabled(
                text.trimmingCharacters(
                    in: .whitespacesAndNewlines
                ).isEmpty
            )
        }
        .padding()
    }
}
