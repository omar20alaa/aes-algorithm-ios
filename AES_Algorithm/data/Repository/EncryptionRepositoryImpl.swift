//
//  EncryptionRepositoryImpl.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 08/10/2026.
//

final class EncryptionRepositoryImpl: EncryptionRepository {

    private let crypto: AESCBCCrypto

    init(crypto: AESCBCCrypto) {
        self.crypto = crypto
    }

    func encrypt(text: String) throws -> String {
        try crypto.encrypt(text: text)
    }

    func decrypt(text: String) throws -> String {
        try crypto.decrypt(text: text)
    }
}
