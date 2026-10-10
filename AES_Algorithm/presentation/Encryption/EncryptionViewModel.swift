//
//  EncryptionViewModel.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 08/10/2026.
//

import Foundation
import Observation

@Observable
final class EncryptionViewModel {

    var inputText = ""
    var encryptedText = ""
    var decryptedText = ""
    var errorMessage: String?

    private let encryptTextUseCase: EncryptTextUseCase
    private let decryptTextUseCase: DecryptTextUseCase

    init(
        encryptTextUseCase: EncryptTextUseCase,
        decryptTextUseCase: DecryptTextUseCase
    ) {
        self.encryptTextUseCase = encryptTextUseCase
        self.decryptTextUseCase = decryptTextUseCase
    }

    func encrypt() {
        do {
            encryptedText = try encryptTextUseCase.execute(
                text: inputText
            )

            errorMessage = nil

        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func decrypt() {
        do {
            decryptedText = try decryptTextUseCase.execute(
                text: encryptedText
            )

            errorMessage = nil

        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
