/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.15063)
public extension PipelineLibrary {
    
}

@available(Windows, introduced: 10.0.15063)
extension PipelineLibrary {
    typealias RawValue1 = WinSDK.ID3D12PipelineLibrary1
    convenience init(_ rawValue: inout RawValue1) {
        self.init(win32Pointer: &rawValue, data: nil)
    } 
}
@available(Windows, introduced: 10.0.15063)
extension PipelineLibrary.RawValue1 {
    static var interfaceID: IID {WinSDK.IID_ID3D12PipelineLibrary1}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.15063)
@available(*, deprecated, renamed: "PipelineLibrary")
public typealias ID3D12PipelineLibrary1 = PipelineLibrary 

@available(Windows, introduced: 10.0.15063)
public extension PipelineLibrary {

}

#endif
