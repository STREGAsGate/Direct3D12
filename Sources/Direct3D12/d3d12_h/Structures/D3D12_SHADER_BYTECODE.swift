/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Foundation

/// Describes shader data.
public struct D3DShaderBytecode {
    public typealias RawValue = WinSDK.D3D12_SHADER_BYTECODE
    internal var rawValue: RawValue

    /// A pointer to a memory block that contains the shader data.
    public var data: Data? {
        get {
            guard rawValue.pShaderBytecode != nil else {return nil}
            return withUnsafeBytes(of: rawValue.pShaderBytecode) {
                return Data($0)
            }
        }
        set {
            if let newValue = newValue {
                newValue.withUnsafeBytes {
                    self.rawValue.pShaderBytecode = $0.baseAddress!
                }
                rawValue.BytecodeLength = SIZE_T(newValue.count)
            }else{
                rawValue.pShaderBytecode = nil
                rawValue.BytecodeLength = 0
            }
        }
    }

    /** Describes shader data.
    - parameter data: A pointer to a memory block that contains the shader data.
    */
    public init(data: Data?) {
        self.rawValue = RawValue()
        self.data = data
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DShaderBytecode")
public typealias D3D12_SHADER_BYTECODE = D3DShaderBytecode

#endif
