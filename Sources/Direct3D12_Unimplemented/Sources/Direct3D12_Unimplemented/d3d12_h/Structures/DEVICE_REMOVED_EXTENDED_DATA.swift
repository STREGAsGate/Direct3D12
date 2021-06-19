/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

//TODO: This struct shares a name with a class, making it a member for now
extension D3DDeviceRemovedExtendedData {//<-The Class
    public struct D3DDeviceRemovedExtendedData {
        public typealias RawValue = WinSDK.D3D12_DEVICE_REMOVED_EXTENDED_DATA
        internal var rawValue: RawValue


        internal init(_ rawValue: RawValue) {
            self.rawValue = rawValue
        }
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DDeviceRemovedExtendedData.D3DDeviceRemovedExtendedData")
public typealias D3D12_DEVICE_REMOVED_EXTENDED_DATA = D3DDeviceRemovedExtendedData.D3DDeviceRemovedExtendedData

#endif
