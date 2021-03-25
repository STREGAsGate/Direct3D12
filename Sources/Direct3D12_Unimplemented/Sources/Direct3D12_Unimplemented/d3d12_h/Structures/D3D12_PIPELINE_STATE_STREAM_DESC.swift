/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.15063)
public struct D3DPipelineStateStreamDescription {
    public typealias RawValue = WinSDK.D3D12_PIPELINE_STATE_STREAM_DESC
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.15063)
@available(*, deprecated, renamed: "D3DPipelineStateStreamDescription")
public typealias D3D12_PIPELINE_STATE_STREAM_DESC = D3DPipelineStateStreamDescription

@available(Windows, introduced: 10.0.15063)
public extension D3DPipelineStateStreamDescription {

}

#endif
