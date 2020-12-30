/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

//TODO: This struct shares a name with a class, making it a member for now
extension DeviceRemovedExtendedData {//<-The Class
    public struct DeviceRemovedExtendedData {
        internal var rawValue: _d3d12.D3D12_DEVICE_REMOVED_EXTENDED_DATA


        internal init(_ rawValue: _d3d12.D3D12_DEVICE_REMOVED_EXTENDED_DATA) {
            self.rawValue = rawValue
        }
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DeviceRemovedExtendedData.DeviceRemovedExtendedData")
public typealias D3D12_DEVICE_REMOVED_EXTENDED_DATA = DeviceRemovedExtendedData.DeviceRemovedExtendedData

#endif
