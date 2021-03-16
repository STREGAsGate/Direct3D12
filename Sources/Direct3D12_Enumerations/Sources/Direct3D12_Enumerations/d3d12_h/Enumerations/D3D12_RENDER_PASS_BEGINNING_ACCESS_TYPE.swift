/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of access that an application is given to the specified resource(s) at the transition into a render pass.
public enum RenderPassBeginningAccessType {
    ///	Indicates that your application doesn't have any dependency on the prior contents of the resource(s). You also shouldn't have any expectations about those contents, because a display driver may return the previously-written contents, or it may return uninitialized data. You can be assured that reading from the resource(s) won't hang the GPU, even if you do get undefined data back.
    /// A read is defined as a traditional read from an unordered access view (UAV), a shader resource view (SRV), a constant buffer view (CBV), a vertex buffer view (VBV), an index buffer view (IBV), an IndirectArg binding/read, or a blend/depth-testing-induced read.
    case discard
    ///	Indicates that your application has a dependency on the prior contents of the resource(s), so the contents must be loaded from main memory.
    case preserve
    ///	Indicates that your application needs the resource(s) to be cleared to a specific value (a value that your application specifies). This clear occurs whether or not you interact with the resource(s) during the render pass. You specify the clear value at
    /// BeginRenderPass time, in the Clear member of your D3D12_RENDER_PASS_BEGINNING_ACCESS structure.
    case clear
    ///	Indicates that your application will neither read from nor write to the resource(s) during the render pass. You would most likely use this value to indicate that you won't be accessing the depth/stencil plane for a depth/stencil view (DSV). You must pair this value with D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_NO_ACCESS in the corresponding D3D12_RENDER_PASS_ENDING_ACCESS structure.
    case noAccess

    internal var rawValue: WinSDK.D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE {
        switch self {
        case .discard:
            return WinSDK.D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_DISCARD
        case .preserve:
            return WinSDK.D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_PRESERVE
        case .clear:
            return WinSDK.D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_CLEAR
        case .noAccess:
            return WinSDK.D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_NO_ACCESS
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RenderPassBeginningAccessType")
public typealias D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE = RenderPassBeginningAccessType

public extension RenderPassBeginningAccessType  {
    @available(*, deprecated, renamed: "discard")
    static let D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_DISCARD = Self.discard

    @available(*, deprecated, renamed: "preserve")
    static let D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_PRESERVE = Self.preserve

    @available(*, deprecated, renamed: "clear")
    static let D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_CLEAR = Self.clear

    @available(*, deprecated, renamed: "noAccess")
    static let D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_NO_ACCESS = Self.noAccess
}

#endif
