/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Represents the allocations of storage for graphics processing unit (GPU) commands.
public class D3DCommandAllocator: D3DPageable {
    
    /// This method returns E_FAIL if there is an actively recording command list referencing the command allocator. The debug layer will also issue an error in this case.
    public func reset() throws {
        try perform(as: RawValue.self) {(pThis) in
            try pThis.pointee.lpVtbl.pointee.Reset(pThis).checkResult()
        }
    }
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DCommandAllocator {
    typealias RawValue = WinSDK.ID3D12CommandAllocator
}
extension D3DCommandAllocator.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12CommandAllocator}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "D3DCommandAllocator")
public typealias ID3D12CommandAllocator = D3DCommandAllocator

public extension D3DCommandAllocator {
    @available(*, unavailable, renamed: "reset")
    func Reset() -> HRESULT {fatalError("This API is here to make migration easier. There is no implementation.")}
}

#endif
