/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import SwiftCOM
import WinSDK.DirectX.Direct3D12

extension Error {
    public enum Kind {
        case unknownError
        case hresult(HRESULT)
        case text(String)
    }
}

public struct Error: Swift.Error {
    let kind: Kind
    internal init(_ kind: Kind) {
        self.kind = kind
    }
}

extension Error: CustomStringConvertible {
    public var description: String {
        switch kind {
        case let .hresult(hr):
            //SwiftCOM already handles parsing HRESULT errors, so use it.
            return SwiftCOM.COMError(hr: hr).description
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