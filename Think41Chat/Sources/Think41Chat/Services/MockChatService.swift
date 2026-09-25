//
//  MockChatService.swift
//  Think41Chat
//
//  Created by Suren on 25/09/26.
//

import Foundation

public final class MockChatService: ChatService {

    public init() {}

    public func streamResponse(
        for message: String
    ) -> AsyncStream<String> {

        AsyncStream { continuation in
            Task {
                let response = "Hi! This is a simulated streaming response from the chat."

                for word in response.split(separator: " ") {
                    try? await Task.sleep(nanoseconds: 150_000_000)

                    continuation.yield(String(word) + " ")
                }

                continuation.finish()
            }
        }
    }
}
