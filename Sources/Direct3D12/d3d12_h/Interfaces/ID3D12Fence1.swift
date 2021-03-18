/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.16299)
public extension Fence {
    
}

@available(Windows, introduced: 10.0.16299)
extension Fence {
    typealias RawValue1 = WinSDK.ID3D12Fence1
    convenience init(_ rawValue: inout RawValue1) {
        self.init(win32Pointer: &rawValue)
    }
}

@available(Windows, introduced: 10.0.16299)
extension Fence.RawValue1 {
    static var interfaceID: WinSDK.IID {
        return WinSDK.IID_ID3D12Fence1
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.16299, deprecated, renamed: "Fence")
public typealias ID3D12Fence1 = Fence

#endif
