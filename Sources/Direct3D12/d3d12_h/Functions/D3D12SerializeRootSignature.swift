/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import Foundation
import WinSDK

/** Serializes a root signature version 1.0 that can be passed to ID3D12Device::CreateRootSignature.
- parameter description: The description of the root signature, as a pointer to a D3D12_ROOT_SIGNATURE_DESC structure.
- parameter version: A D3D_ROOT_SIGNATURE_VERSION-typed value that specifies the version of root signature.
- note: For Swift this step is folded directly into device.createRootSignature, so pass this functions variables directly into that function.
*/
public func serializeRootSignature(_ description: D3DRootSignatureDescription, version: D3DRootSignatureVersion) throws -> D3DBlob {
    var pRootSignature = description.rawValue
    let Version = version.rawValue
    var ppBlob: UnsafeMutablePointer<WinSDK.ID3DBlob>?
    var ppErrorBlob: UnsafeMutablePointer<WinSDK.ID3DBlob>?
    let hresult = WinSDK.D3D12SerializeRootSignature(&pRootSignature, Version, &ppBlob, &ppErrorBlob)
    if hresult.isSuccess == false {
        if let error = D3DBlob(winSDKPointer: ppErrorBlob) {
            print("D3D12 Error:", error.stringValue!)
        }
        try hresult.checkResult(nil, #function)
    }
    guard let v = D3DBlob(winSDKPointer: ppBlob) else {print("nil pointer"); throw Error(.invalidArgument)}
    return v
}
