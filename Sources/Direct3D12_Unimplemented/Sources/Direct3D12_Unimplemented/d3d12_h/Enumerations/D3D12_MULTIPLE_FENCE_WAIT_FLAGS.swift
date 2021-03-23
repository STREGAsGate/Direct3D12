/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies multiple wait flags for multiple fences.
public struct MultipleFenceWaitFlags: OptionSet {
    public typealias RawType = WinSDK.D3D12_MULTIPLE_FENCE_WAIT_FLAGS
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No flags.
    //public static let none = MultipleFenceWaitFlags(rawValue: WinSDK.D3D12_MULTIPLE_FENCE_WAIT_FLAG_NONE.rawValue)

    /// Modifies behavior to indicate that the event should be signaled after any one of the fence values has been reached by its corresponding fence.
    public static let any = MultipleFenceWaitFlags(rawValue: WinSDK.D3D12_MULTIPLE_FENCE_WAIT_FLAG_ANY.rawValue)

    /// An alias for D3D12_MULTIPLE_FENCE_WAIT_FLAG_NONE, meaning to use the default behavior and wait for all fences.    
    public static let all = MultipleFenceWaitFlags(rawValue: WinSDK.D3D12_MULTIPLE_FENCE_WAIT_FLAG_ALL.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "MultipleFenceWaitFlags")
public typealias D3D12_MULTIPLE_FENCE_WAIT_FLAGS = MultipleFenceWaitFlags

public extension MultipleFenceWaitFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_MULTIPLE_FENCE_WAIT_FLAG_NONE: MultipleFenceWaitFlags = []

    @available(*, deprecated, renamed: "any")
    static let D3D12_MULTIPLE_FENCE_WAIT_FLAG_ANY = Self.any

    @available(*, deprecated, renamed: "all")
    static let D3D12_MULTIPLE_FENCE_WAIT_FLAG_ALL = Self.all
}

#endif
