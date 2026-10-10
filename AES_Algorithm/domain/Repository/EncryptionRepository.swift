//
//  EncryptionRepository.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 08/10/2026.
//

protocol EncryptionRepository {

    func encrypt(text: String) throws -> String

    func decrypt(text: String) throws -> String
}
