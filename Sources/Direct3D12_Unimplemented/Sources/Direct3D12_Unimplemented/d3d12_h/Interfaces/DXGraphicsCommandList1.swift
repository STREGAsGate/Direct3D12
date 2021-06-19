/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.15063)
public extension GraphicsCommandList {
    func atomicCopyBufferUINT(_ pDstBuffer: Any,
                              _ DstOffset: Any,
                              _ pSrcBuffer: Any.
                              _ SrcOffset: Any,
                              _ Dependencies: Any,
                              _ ppDependentResources: Any,
                              _ pDependentSubresourceRanges: Any) {        
    }
}

@available(Windows, introduced: 10.0.15063)
extension GraphicsCommandList {
    typealias RawValue1 = WinSDK.ID3D12GraphicsCommandList1
    convenience init(_ rawValue: inout RawValue1) {
        self.init(win32Pointer: &rawValue)
    } 
}
@available(Windows, introduced: 10.0.15063)
extension GraphicsCommandList.RawValue1 {
    static var interfaceID: IID {WinSDK.IID_ID3D12GraphicsCommandList1}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.15063)
@available(*, deprecated, renamed: "GraphicsCommandList")
public typealias ID3D12GraphicsCommandList1 = GraphicsCommandList 

@available(Windows, introduced: 10.0.15063)
public extension GraphicsCommandList {
    @available(*, unavailable, renamed: "atomicCopyBufferUINT(source:at:destination:at:dependencies:ranges:)")
    func AtomicCopyBufferUINT(_ pDstBuffer: Any,
                              _ DstOffset: Any,
                              _ pSrcBuffer: Any.
                              _ SrcOffset: Any,
                              _ Dependencies: Any,
                              _ ppDependentResources: Any,
                              _ pDependentSubresourceRanges: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}
#endif
