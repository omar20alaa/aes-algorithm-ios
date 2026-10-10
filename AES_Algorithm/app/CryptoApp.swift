//
//  CryptoApp.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 07/10/2026.
//

import SwiftUI


@main
struct SecureTextApp: App {

    private let container = AppContainer()

    var body: some Scene {

        WindowGroup {

            EncryptionView(
                viewModel: EncryptionViewModel(
                    encryptTextUseCase: container.encryptTextUseCase,
                    decryptTextUseCase: container.decryptTextUseCase
                )
            )
        }
    }
}
