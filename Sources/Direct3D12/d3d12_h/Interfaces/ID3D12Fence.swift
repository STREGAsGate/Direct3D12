/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Represents a fence, an object used for synchronization of the CPU and one or more GPUs.
public class Fence: Pageable {
    
    /// Gets the current value of the fence.
    public var value: UInt64 {
        return performFatally(as: RawValue.self) {pThis in
            return pThis.pointee.lpVtbl.pointee.GetCompletedValue(pThis)
        }
    }

    /** Specifies an event that should be fired when the fence reaches a certain value.
    - parameter handle: A handle to the event object.
    - parameter value: The fence value when the event is to be signaled.
    */
    public func setCompletionEvent(_ handle: UnsafeMutableRawPointer, whenValueIs value: UInt64) throws {
        try perform(as: RawValue.self) {pThis in
            let Value = value
            let hEvent = handle
            try pThis.pointee.lpVtbl.pointee.SetEventOnCompletion(pThis, Value, hEvent).checkResult()
        }
    }

    /** Sets the fence to the specified value.
    - parameter value: The value to set the fence to.
    */
    public func signal(_ value: UInt64) throws {
        try perform(as: RawValue.self) {pThis in
            let Value = value
            try pThis.pointee.lpVtbl.pointee.Signal(pThis, Value).checkResult()
        }
    }

    override class var interfaceID: WinSDK.IID {
        if #available(Windows 10.0.16299, *) {
            return RawValue1.interfaceID
        }
        return RawValue.interfaceID
    }
}

extension Fence {
    typealias RawValue = WinSDK.ID3D12Fence
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension Fence.RawValue {
    static var interfaceID: WinSDK.IID {
        return WinSDK.IID_ID3D12Fence
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Fence")
public typealias ID3D12Fence = Fence

public extension Fence {
    @available(*, unavailable, renamed: "value")
    func GetCompletedValue() -> UInt64 {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "setCompletionEvent(_:whenValueIs:)")
    func SetEventOnCompletion(_ value: Any,
                              _ handle: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "signal(_:)")
    func Signal(_ value: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
