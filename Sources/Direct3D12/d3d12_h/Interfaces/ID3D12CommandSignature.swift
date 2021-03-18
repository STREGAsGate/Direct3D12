/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// A command signature object enables apps to specify indirect drawing, including the buffer format, command type and resource bindings to be used.
public class CommandSignature: Pageable {
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension CommandSignature {
    typealias RawValue = WinSDK.ID3D12CommandSignature
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension CommandSignature.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12CommandSignature}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "CommandSignature")
public typealias ID3D12CommandSignature = CommandSignature 

#endif
