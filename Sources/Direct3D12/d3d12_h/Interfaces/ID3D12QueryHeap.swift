/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public class QueryHeap: Pageable {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension QueryHeap {
    typealias RawValue = WinSDK.ID3D12QueryHeap
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension QueryHeap.RawValue {
    static var interfaceID: WinSDK.IID {
        return WinSDK.IID_ID3D12QueryHeap
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "QueryHeap")
public typealias ID3D12QueryHeap = QueryHeap 

#endif
