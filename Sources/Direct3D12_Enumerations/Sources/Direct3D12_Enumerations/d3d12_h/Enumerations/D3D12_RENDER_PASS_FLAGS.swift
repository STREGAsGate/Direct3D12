/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the nature of the render pass; for example, whether it is a suspending or a resuming render pass.
public struct RenderPassFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates that the render pass has no special requirements.
    //static let none = RenderPassFlags(rawValue: WinSDK.D3D12_RENDER_PASS_FLAG_NONE.rawValue)

    ///	Indicates that writes to unordered access view(s) should be allowed during the render pass.
    static let allowUnorderedAccessViewWrites = RenderPassFlags(rawValue: WinSDK.D3D12_RENDER_PASS_FLAG_ALLOW_UAV_WRITES.rawValue)
    ///	Indicates that this is a suspending render pass.
    static let suspendingPass = RenderPassFlags(rawValue: WinSDK.D3D12_RENDER_PASS_FLAG_SUSPENDING_PASS.rawValue)
    ///	Indicates that this is a resuming render pass.
    static let resumingPass = RenderPassFlags(rawValue: WinSDK.D3D12_RENDER_PASS_FLAG_RESUMING_PASS.rawValue)
    
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RenderPassFlags")
public typealias D3D12_RENDER_PASS_FLAGS = RenderPassFlags

public extension RenderPassFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_RENDER_PASS_FLAG_NONE: RenderPassFlags = []

    @available(*, deprecated, renamed: "allowUnorderedAccessViewWrites")
    static let D3D12_RENDER_PASS_FLAG_ALLOW_UAV_WRITES = Self.allowUnorderedAccessViewWrites

    @available(*, deprecated, renamed: "suspendingPass")
    static let D3D12_RENDER_PASS_FLAG_SUSPENDING_PASS = Self.suspendingPass

    @available(*, deprecated, renamed: "resumingPass")
    static let D3D12_RENDER_PASS_FLAG_RESUMING_PASS = Self.resumingPass
}

#endif
