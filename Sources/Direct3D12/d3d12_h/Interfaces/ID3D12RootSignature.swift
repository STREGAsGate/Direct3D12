/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// The root signature defines what resources are bound to the graphics pipeline. A root signature is configured by the app and links command lists to the resources the shaders require. Currently, there is one graphics and one compute root signature per app.
public class D3DRootSignature: D3DDeviceChild {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DRootSignature {
    public typealias RawValue = WinSDK.ID3D12RootSignature
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension D3DRootSignature.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12RootSignature}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DRootSignature")
public typealias ID3D12RootSignature = D3DRootSignature 

#endif
