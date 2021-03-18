/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import Foundation
import WinSDK

@available(Windows, introduced: 10.0.14393)
public class PipelineLibrary: DeviceChild {
    /// The strongly reference Data used to create the PipelineLibrary.
    let data: Data?

    init(win32Pointer pointer: UnsafeMutableRawPointer, data: Data?) {
        self.data = data
        super.init(win32Pointer: pointer)
    }

    override class var interfaceID: WinSDK.IID {
        if #available(Windows 10.0.15063, *) {
            return RawValue1.interfaceID//ID3D12PipelineLibrary1
        }else{
            return RawValue.interfaceID //ID3D12PipelineLibrary
        }
    }
}

@available(Windows, introduced: 10.0.14393)
extension PipelineLibrary {
    typealias RawValue = WinSDK.ID3D12PipelineLibrary
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue, data: nil)
    } 
}
@available(Windows, introduced: 10.0.14393)
extension PipelineLibrary.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12PipelineLibrary}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.14393)
@available(*, deprecated, renamed: "PipelineLibrary")
public typealias ID3D12PipelineLibrary = PipelineLibrary 

@available(Windows, introduced: 10.0.14393)
public extension  PipelineLibrary {
    
}

#endif
