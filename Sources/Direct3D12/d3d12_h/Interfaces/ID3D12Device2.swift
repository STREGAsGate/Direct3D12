/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.15063)
public extension Device {
    /** Creates a pipeline state object from a pipeline state stream description.
    - parameter description: The address of a D3D12_PIPELINE_STATE_STREAM_DESC structure that describes the pipeline state.
    */
    func createPipelineState(with description: PipelineStateStreamDescription) throws -> PipelineState {
        return try perform(as: RawValue2.self) {pThis in
            var pDesc = description.rawValue
            var riid = PipelineState.interfaceID
            var ppPipelineState: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreatePipelineState(pThis, &pDesc, &riid, &ppPipelineState).checkResult()
            guard let p = ppPipelineState else {throw Error(.invalidArgument)}
            return PipelineState(win32Pointer: p)
        }
    }
}

@available(Windows, introduced: 10.0.15063)
extension Device {
    typealias RawValue2 = WinSDK.ID3D12Device2
    convenience init(_ rawValue: inout RawValue2) {
        self.init(win32Pointer: &rawValue)
    } 
}
@available(Windows, introduced: 10.0.15063)
extension Device.RawValue2 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device2}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.15063)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device2 = Device

@available(Windows, introduced: 10.0.15063)
public extension Device {
    @available(*, unavailable, renamed: "createPipelineState")
    func CreatePipelineState(_ pDesc: Any,
                             _ riid: Any,
                             _ ppPipelineState: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
