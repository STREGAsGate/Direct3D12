/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class D3DQueryHeap: D3DPageable {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DQueryHeap {
    typealias RawValue = WinSDK.ID3D12QueryHeap
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension D3DQueryHeap.RawValue {
    static var interfaceID: WinSDK.IID {
        return WinSDK.IID_ID3D12QueryHeap
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DQueryHeap")
public typealias ID3D12QueryHeap = D3DQueryHeap 

#endif
