/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

@available(Windows, introduced: 10.0.15063)
public struct PipelineStateStreamDescription {
    internal var rawValue: WinSDK.D3D12_PIPELINE_STATE_STREAM_DESC


    internal init(_ rawValue: WinSDK.D3D12_PIPELINE_STATE_STREAM_DESC) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.15063)
@available(*, deprecated, renamed: "PipelineStateStreamDescription")
public typealias D3D12_PIPELINE_STATE_STREAM_DESC = PipelineStateStreamDescription

@available(Windows, introduced: 10.0.15063)
public extension PipelineStateStreamDescription {

}

#endif
