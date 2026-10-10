//
//  AppContainer.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 08/10/2026.
//

final class AppContainer {

    let encryptionRepository: EncryptionRepository
    let encryptTextUseCase: EncryptTextUseCase
    let decryptTextUseCase: DecryptTextUseCase

    init() {

        let key = Array(
            "12345678901234567890123456789012".utf8
        )

        let iv = Array(
            "1234567890123456".utf8
        )

        let crypto = AESCBCCrypto(
            key: key,
            iv: iv
        )

        let repository = EncryptionRepositoryImpl(
            crypto: crypto
        )

        self.encryptionRepository = repository

        self.encryptTextUseCase = EncryptTextUseCase(
            repository: repository
        )

        self.decryptTextUseCase = DecryptTextUseCase(
            repository: repository
        )
    }
}
