/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class D3DResource: D3DPageable {
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DResource {
    public typealias RawValue = WinSDK.ID3D12Resource
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension D3DResource.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12Resource}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "D3DResource")
public typealias ID3D12Resource = D3DResource 

#endif
