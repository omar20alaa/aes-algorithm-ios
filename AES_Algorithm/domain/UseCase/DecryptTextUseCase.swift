//
//  DecryptTextUseCase.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 08/10/2026.
//

struct DecryptTextUseCase {

    private let repository: EncryptionRepository

    init(repository: EncryptionRepository) {
        self.repository = repository
    }

    func execute(text: String) throws -> String {
        try repository.decrypt(text: text)
    }
}
