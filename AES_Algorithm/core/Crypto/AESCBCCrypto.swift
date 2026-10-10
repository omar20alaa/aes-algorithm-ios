//
//  AESCBCCrypto.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 08/10/2026.
//

import CryptoSwift
import Foundation

final class AESCBCCrypto {

    private let key: Array<UInt8>
    private let iv: Array<UInt8>

    init(key: Array<UInt8>, iv: Array<UInt8>) {
        self.key = key
        self.iv = iv
    }

    func encrypt(text: String) throws -> String {
        let data = Array(text.utf8)

        let aes = try AES(
            key: key,
            blockMode: CBC(iv: iv),
            padding: .pkcs7
        )

        let encrypted = try aes.encrypt(data)

        return Data(encrypted).base64EncodedString()
    }

    func decrypt(text: String) throws -> String {
        guard let data = Data(base64Encoded: text) else {
            throw CryptoError.invalidBase64
        }

        let aes = try AES(
            key: key,
            blockMode: CBC(iv: iv),
            padding: .pkcs7
        )

        let decrypted = try aes.decrypt(Array(data))

        guard let result = String(bytes: decrypted, encoding: .utf8) else {
            throw CryptoError.invalidUTF8
        }

        return result
    }
}

enum CryptoError: Error {
    case invalidBase64
    case invalidUTF8
}
