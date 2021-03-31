/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import Foundation
import WinSDK

public func compileFromFile(_ url: URL, functionName: String, target: String) throws -> D3DBlob {
    let pFileName = url.withUnsafeFileSystemRepresentation {
        return String(cString: $0!).windowsUTF16
    }
    let pDefines: [D3D_SHADER_MACRO] = [D3D_SHADER_MACRO(Name: nil, Definition: nil)]
    let pInclude: UnsafeMutablePointer<WinSDK.ID3DInclude>? = nil
    let pEntrypoint = functionName.windowsUTF8
    let pTarget = target.windowsUTF8
    var ppCode: UnsafeMutablePointer<WinSDK.ID3DBlob>?
    var ppErrorMsgs: UnsafeMutablePointer<WinSDK.ID3DBlob>?
    let hresult = WinSDK.D3DCompileFromFile(pFileName, pDefines, pInclude, pEntrypoint, pTarget, 0, 0, &ppCode, &ppErrorMsgs)
    if hresult.isSuccess == false {
        if let error = D3DBlob(winSDKPointer: ppErrorMsgs) {
            if let string = error.stringValue {
                print("HLSL Error: ", string)
            }
        }
        try hresult.checkResult()
    }
    guard let v = D3DBlob(winSDKPointer: ppCode) else {throw Error(.invalidArgument)}
    return v
}