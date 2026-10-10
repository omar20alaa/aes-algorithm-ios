//
//  EncryptionView.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 08/10/2026.
//

import SwiftUI

struct EncryptionView: View {

    @State private var viewModel: EncryptionViewModel

    init(viewModel: EncryptionViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color.black,
                    Color.blue.opacity(0.35),
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {

                VStack(spacing: 24) {

                    header

                    inputSection

                    encryptButton

                    if !viewModel.encryptedText.isEmpty {
                        encryptedSection
                        decryptButton
                    }

                    if !viewModel.decryptedText.isEmpty {
                        decryptedSection
                    }

                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundStyle(.red)
                            .font(.footnote)
                    }
                }
                .padding(20)
            }
        }
    }

    private var header: some View {

        VStack(spacing: 8) {

            Image(systemName: "lock.shield.fill")
                .font(.system(size: 52))
                .foregroundStyle(.cyan)

            Text("SecureText")
                .font(.largeTitle.bold())

            Text("AES-CBC Encryption")
                .foregroundStyle(.secondary)
        }
        .foregroundStyle(.white)
    }

    private var inputSection: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Your Text")
                .font(.headline)
                .foregroundStyle(.white)

            TextEditor(text: $viewModel.inputText)
                .frame(minHeight: 140)
                .padding(10)
                .keyboardType(.asciiCapable)
                .scrollContentBackground(.hidden)
                .background(.white.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.white)
        }
    }

    private var encryptButton: some View {

        Button {
            viewModel.encrypt()
        } label: {

            Label("Encrypt", systemImage: "lock.fill")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.cyan)
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

    private var encryptedSection: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Encrypted")
                .font(.headline)
                .foregroundStyle(.white)

            Text(viewModel.encryptedText)
                .font(.system(.body, design: .monospaced))
                .foregroundStyle(.green)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

    private var decryptButton: some View {

        Button {
            viewModel.decrypt()
        } label: {

            Label("Decrypt", systemImage: "lock.open.fill")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.green)
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

    private var decryptedSection: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Decrypted")
                .font(.headline)
                .foregroundStyle(.white)

            Text(viewModel.decryptedText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.white.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.white)
        }
    }
}
