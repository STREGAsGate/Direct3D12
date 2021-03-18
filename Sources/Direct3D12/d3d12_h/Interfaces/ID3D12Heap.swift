/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class Heap: Pageable {
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension Heap {
    typealias RawValue = WinSDK.ID3D12Heap
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension Heap.RawValue {
    static var interfaceID: WinSDK.IID {
        return WinSDK.IID_ID3D12Heap
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Heap")
public typealias ID3D12Heap = Heap 

#endif
