/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public class Fence: Pageable {
    
    override class var interfaceID: WinSDK.IID {
        if #available(Windows 10.0.1709, *) {
            return RawValue1.interfaceID
        }
        return RawValue.interfaceID
    }
}

extension Fence {
    typealias RawValue = WinSDK.ID3D12Fence
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension Fence.RawValue {
    static var interfaceID: WinSDK.IID {
        return WinSDK.IID_ID3D12Fence
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Fence")
public typealias ID3D12Fence = Fence 

#endif
