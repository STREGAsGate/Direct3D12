/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK


@available(Windows, introduced: 10.0.16299)
public extension Device {
    
}

@available(Windows, introduced: 10.0.16299)
extension Device {
    typealias RawValue3 = WinSDK.ID3D12Device3
    convenience init(_ rawValue: inout RawValue3) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.16299)
extension Device.RawValue3 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device3}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device3 = Device

@available(Windows, introduced: 10.0.16299)
public extension Device {

}

#endif
