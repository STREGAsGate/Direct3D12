/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.16299)
public extension Fence {
    /// Gets the flags used to create the fence represented by the current instance.
    var creationFlags: FenceFlags {
        return performFatally(as: RawValue1.self) {pThis in
            let v = pThis.pointee.lpVtbl.pointee.GetCreationFlags(pThis)
            return FenceFlags(rawValue: v.rawValue)
        }
    }
}

@available(Windows, introduced: 10.0.16299)
extension Fence {
    typealias RawValue1 = WinSDK.ID3D12Fence1
    convenience init(_ rawValue: inout RawValue1) {
        self.init(win32Pointer: &rawValue)
    }
}

@available(Windows, introduced: 10.0.16299)
extension Fence.RawValue1 {
    static var interfaceID: WinSDK.IID {
        return WinSDK.IID_ID3D12Fence1
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.16299, deprecated, renamed: "Fence")
public typealias ID3D12Fence1 = Fence

@available(Windows, introduced: 10.0.16299)
public extension Fence {
    @available(*, unavailable, renamed: "creationFlags")
    func GetCreationFlags() -> FenceFlags.RawValue {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
