/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// This interface is used to return arbitrary-length data.
public class D3DBlob: IUnknown {

    /// Gets a pointer to the data.
    public var bufferPointer: LPVOID? {
        return performFatally(as: RawValue.self) {pThis in
            return pThis.pointee.lpVtbl.pointee.GetBufferPointer(pThis)
        }
    }

    /// Gets the size.
    public var bufferSize: SIZE_T {
        return performFatally(as: RawValue.self) {pThis in
            return pThis.pointee.lpVtbl.pointee.GetBufferSize(pThis)
        }
    }

    public var stringValue: String? {
        guard bufferSize > 0, let bufferPointer = bufferPointer else {return nil}
        let pointer = bufferPointer.bindMemory(to: CHAR.self, capacity: 1)
        return String(cString: pointer)
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DBlob {
    typealias RawValue = WinSDK.ID3D10Blob
}
extension D3DBlob.RawValue {
    static var interfaceID: WinSDK.IID {
        return IID_ID3D10Blob
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DBlob")
public typealias ID3DBlob = D3DBlob

public extension D3DBlob {
    @available(*, unavailable, renamed: "bufferPointer")
    func GetBufferPointer() -> LPVOID {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "bufferSize")
    func GetBufferSize() -> SIZE_T {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
