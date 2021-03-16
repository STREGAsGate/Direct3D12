/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of access that an application is given to the specified resource(s) at the transition out of a render pass.
public enum RenderPassEndingAccessType {
    ///	Indicates that your application won't have any future dependency on any data that you wrote to the resource(s) during this render pass. For example, a depth buffer that won't be textured from before it's written to again.
    case discard
    ///	Indicates that your application will have a dependency on the written contents of the resource(s) in the future, and so they must be preserved.
    case preserve
    ///	Indicates that the resource(s)—for example, a multi-sample anti-aliasing (MSAA) surface—should be directly resolved to a separate resource at the conclusion of the render pass. For a tile-based deferred renderer (TBDR), this should ideally happenwhile the MSAA contents are still in the tile cache. You should ensure that the resolve destination is in the D3D12_RESOURCE_STATE_RESOLVE_DEST resource state when the render pass ends. The resolve source is left in its initial resource state at the time the render pass ends. A resolve operation submitted by a render pass doesn't implicitly change the state of any resource.
    case resolve
    ///	Indicates that your application will neither read from nor write to the resource(s) during the render pass. You would most likely use this value to indicate that you won't be accessing the depth/stencil plane for a depth/stencil view (DSV). You must pair this value with D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_NO_ACCESS in the corresponding D3D12_RENDER_PASS_BEGINNING_ACCESS structure.
    case noAccess

    internal var rawValue: WinSDK.D3D12_RENDER_PASS_ENDING_ACCESS_TYPE {
        switch self {
        case .discard:
            return WinSDK.D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_DISCARD
        case .preserve:
            return WinSDK.D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_PRESERVE
        case .resolve:
            return WinSDK.D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_RESOLVE
        case .noAccess:
            return WinSDK.D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_NO_ACCESS
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RenderPassEndingAccessType")
public typealias D3D12_RENDER_PASS_ENDING_ACCESS_TYPE = RenderPassEndingAccessType

public extension RenderPassEndingAccessType  {
    @available(*, deprecated, renamed: "discard")
    static let D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_DISCARD = Self.discard

    @available(*, deprecated, renamed: "preserve")
    static let D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_PRESERVE = Self.preserve

    @available(*, deprecated, renamed: "resolve")
    static let D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_RESOLVE = Self.resolve

    @available(*, deprecated, renamed: "noAccess")
    static let D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_NO_ACCESS = Self.noAccess
}

#endif
