/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public class Device: Object {
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension Device {
    typealias RawValue = WinSDK.ID3D12DescriptorHeap
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension Device.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12DescriptorHeap}
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device = Device 

#endif
