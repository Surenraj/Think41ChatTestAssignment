//
//  ChatMessage.swift
//  Think41Chat
//
//  Created by Suren on 24/09/26.
//

import Foundation

public struct ChatMessage: Identifiable, Equatable {
    public let id: UUID
    public var text: String
    public let isUser: Bool

    public init(
        id: UUID = UUID(),
        text: String,
        isUser: Bool
    ) {
        self.id = id
        self.text = text
        self.isUser = isUser
    }
}
