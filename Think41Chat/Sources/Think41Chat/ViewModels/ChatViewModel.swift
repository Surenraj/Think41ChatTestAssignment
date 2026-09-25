//
//  ChatViewModel.swift
//  Think41Chat
//
//  Created by Suren on 25/09/26.
//

import Foundation
import Observation

@MainActor
final class ChatViewModel: ObservableObject {

    @Published var messages: [ChatMessage] = []
    @Published var inputText = ""

    private let service: ChatService
    private var task: Task<Void, Never>?

    init(service: ChatService) {
        self.service = service
    }

    func sendMessage() {
        let text = inputText.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !text.isEmpty else { return }

        messages.append(
            ChatMessage(
                text: text,
                isUser: true
            )
        )

        inputText = ""

        let assistantID = UUID()

        messages.append(
            ChatMessage(
                id: assistantID,
                text: "",
                isUser: false
            )
        )

        task?.cancel()

        task = Task {
            for await chunk in service.streamResponse(for: text) {
                guard !Task.isCancelled else { return }

                if let index = messages.firstIndex(
                    where: { $0.id == assistantID }
                ) {
                    messages[index].text += chunk
                }
            }
        }
    }
}
