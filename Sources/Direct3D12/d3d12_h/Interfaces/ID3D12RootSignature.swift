/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class RootSignature: DeviceChild {
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension RootSignature {
    public typealias RawValue = WinSDK.ID3D12RootSignature
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension RootSignature.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12RootSignature}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RootSignature")
public typealias ID3D12RootSignature = RootSignature 

#endif
