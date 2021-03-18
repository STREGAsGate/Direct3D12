/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

//TODO: This struct shares a name with a class, making it a member for now
extension DeviceRemovedExtendedData {//<-The Class
    public struct DeviceRemovedExtendedData {
        internal var rawValue: WinSDK.D3D12_DEVICE_REMOVED_EXTENDED_DATA


        internal init(_ rawValue: WinSDK.D3D12_DEVICE_REMOVED_EXTENDED_DATA) {
            self.rawValue = rawValue
        }
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DeviceRemovedExtendedData.DeviceRemovedExtendedData")
public typealias D3D12_DEVICE_REMOVED_EXTENDED_DATA = DeviceRemovedExtendedData.DeviceRemovedExtendedData

#endif
