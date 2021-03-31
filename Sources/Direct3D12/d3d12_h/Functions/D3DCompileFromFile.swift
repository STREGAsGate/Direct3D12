/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public func compileFromFile(_ path: String, functionName: String, shaderModel: String) throws -> D3DBlob {
    let pFileName = path.windowsUTF16
    let pDefines: [D3D_SHADER_MACRO] = []
    let pInclude: UnsafeMutablePointer<WinSDK.ID3DInclude>? = nil
    let pEntrypoint = path.windowsUTF8
    let pTarget = shaderModel.windowsUTF8
    var ppCode: UnsafeMutablePointer<WinSDK.ID3DBlob>?
    var ppErrorMsgs: UnsafeMutablePointer<WinSDK.ID3DBlob>?
    let hresult = WinSDK.D3DCompileFromFile(pFileName, pDefines, pInclude, pEntrypoint, pTarget, 0, 0, &ppCode, &ppErrorMsgs)
    if hresult.isSuccess == false {
        if let error = D3DBlob(winSDKPointer: ppErrorMsgs)?.stringValue {
            throw Error("HLSL error: \(error)")
        }else{
            try hresult.checkResult()
        }
    }
    try hresult.checkResult()
    guard let v = D3DBlob(winSDKPointer: ppCode) else {throw Error(.invalidArgument)}
    return v
}