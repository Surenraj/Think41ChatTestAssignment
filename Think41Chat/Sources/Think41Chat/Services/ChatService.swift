//
//  ChatService.swift
//  Think41Chat
//
//  Created by Suren on 24/09/26.
//

public protocol ChatService {
    func streamResponse(for message: String) -> AsyncStream<String>
}
