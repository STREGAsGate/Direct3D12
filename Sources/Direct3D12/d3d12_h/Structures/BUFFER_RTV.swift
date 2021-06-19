/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the elements in a buffer resource to use in a render-target view.
public struct D3DRenderTargetViewBuffer {
    public typealias RawValue = WinSDK.D3D12_BUFFER_RTV
    internal var rawValue: RawValue

    /// Number of bytes between the beginning of the buffer and the first element to access.
    public var index: UInt64 {
        get {
            return rawValue.FirstElement
        }
        set {
            rawValue.FirstElement = newValue
        }
    }

    /// The total number of elements in the view.
    public var count: UInt32 {
        get {
            return rawValue.NumElements
        }
        set {
            rawValue.NumElements = newValue
        }
    }

    /** Describes the elements in a buffer resource to use in a render-target view.
    - parameter index: Number of bytes between the beginning of the buffer and the first element to access.
    - parameter count: The total number of elements in the view.
    */
    public init(index: UInt64, count: UInt32) {
        self.rawValue = RawValue(FirstElement: index, NumElements: count)
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DRenderTargetViewBuffer")
public typealias D3D12_BUFFER_RTV = D3DRenderTargetViewBuffer 

#endif
