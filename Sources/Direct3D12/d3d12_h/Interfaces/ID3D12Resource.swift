/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class Resource: Pageable {
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension Resource {
    public typealias RawValue = WinSDK.ID3D12Resource
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension Resource.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12Resource}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "Resource")
public typealias ID3D12Resource = Resource 

#endif
