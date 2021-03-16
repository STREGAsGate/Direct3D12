/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Represents the allocations of storage for graphics processing unit (GPU) commands.
public class CommandAllocator: Pageable {
    
    /// This method returns E_FAIL if there is an actively recording command list referencing the command allocator. The debug layer will also issue an error in this case.
    public func reset() throws {return try perform(as: RawValue.self) {(pThis) in
        try checkResult(pThis.pointee.lpVtbl.pointee.Reset(pThis))
    }}
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension CommandAllocator {
    typealias RawValue = WinSDK.ID3D12CommandAllocator
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension CommandAllocator.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12CommandAllocator}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "CommandAllocator")
public typealias ID3D12CommandAllocator = CommandAllocator

public extension CommandAllocator {
    @available(*, unavailable, renamed: "reset")
    func Reset() -> HRESULT {fatalError("This API is here to make migration easier. There is no implimnetation.")}
}

#endif
