/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

extension Error {
    public enum Kind {
        case unknown
        case hresult(WinSDK.HRESULT)
        case text(String)
    }
}

public struct Error: Swift.Error {
    let kind: Kind
    internal init(_ kind: Kind) {
        self.kind = kind
    }

    internal init(_ hr: HRESULT) {
        self.kind = .hresult(hr)
    }

    internal init(_ string: String) {
        self.kind = .text(string)
    }
}

extension Error: CustomStringConvertible {
    public var description: String {
        switch kind {
        case let .hresult(hr):
            return hr.string
        case let .text(text):
            return text
        default:
            return "\(kind)"
        }
    }
}

extension Error: CustomDebugStringConvertible {
    public var debugDescription: String {
        return description
    }
}

internal extension HRESULT {
    static let S_OK = WinSDK.S_OK
    static let E_INVALIDARG = HRESULT(bitPattern: 0x80070057)
}

fileprivate extension HRESULT {
    var string: String {
        let dwFlags: DWORD = DWORD(FORMAT_MESSAGE_ALLOCATE_BUFFER) | DWORD(FORMAT_MESSAGE_FROM_SYSTEM) | DWORD(FORMAT_MESSAGE_IGNORE_INSERTS)

        var buffer: UnsafeMutablePointer<WCHAR>? = nil
        let dwResult: DWORD = withUnsafeMutablePointer(to: &buffer) {
            return $0.withMemoryRebound(to: WCHAR.self, capacity: 2) {
                return FormatMessageW(dwFlags, nil, DWORD(bitPattern: self), DWORD((WORD(SUBLANG_DEFAULT) << 10) | WORD(LANG_NEUTRAL)), $0, 0, nil)
            }
        }
        guard dwResult > 0, let message = buffer else {
            return "HRESULT(0x\(String(DWORD(bitPattern: self), radix: 16)))"
        }
        defer {LocalFree(buffer)}
        return "0x\(String(DWORD(bitPattern: self), radix: 16)) - \(String(decodingCString: message, as: UTF16.self))"
    }
}