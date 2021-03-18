/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class PipelineState: Pageable {
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension PipelineState {
    typealias RawValue = WinSDK.ID3D12PipelineState
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension PipelineState.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12PipelineState}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "PipelineState")
public typealias ID3D12PipelineState = PipelineState 

#endif
