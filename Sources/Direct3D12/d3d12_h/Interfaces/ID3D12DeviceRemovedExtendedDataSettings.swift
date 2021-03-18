/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.18362)
public class DeviceRemovedExtendedDataSettings: IUnknown {
    
    /** Configures the enablement settings for Device Removed Extended Data (DRED) auto-breadcrumbs.
    - parameter enablement: A D3D12_DRED_ENABLEMENT value. The default is D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED.
    */
    public func setAutoBreadcrumbsEnablement(_ enablement: DREDEnablement) {
        performFatally(as: RawValue.self) {pThis in
            let Enablement = enablement.rawValue
            pThis.pointee.lpVtbl.pointee.SetAutoBreadcrumbsEnablement(pThis, Enablement)
        }
    }

    /** Configures the enablement settings for Device Removed Extended Data (DRED) page fault reporting.
    - parameter enablement: A D3D12_DRED_ENABLEMENT value. The default is D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED.
    */
    public func setPageFaultEnablement(_ enablement: DREDEnablement) {
        performFatally(as: RawValue.self) {pThis in
            let Enablement = enablement.rawValue
            pThis.pointee.lpVtbl.pointee.SetPageFaultEnablement(pThis, Enablement)
        }
    }

    /** Configures the enablement settings for Device Removed Extended Data (DRED) dump creation for Windows Error Reporting (WER), also known as Watson.
    - parameter enablement: A D3D12_DRED_ENABLEMENT value. The default is D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED.
    */
    public func setWatsonDumpEnablement(_ enablement: DREDEnablement) {
        performFatally(as: RawValue.self) {pThis in
            let Enablement = enablement.rawValue
            pThis.pointee.lpVtbl.pointee.SetWatsonDumpEnablement(pThis, Enablement)
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

@available(Windows, introduced: 10.0.18362)
extension DeviceRemovedExtendedDataSettings {
    typealias RawValue = WinSDK.ID3D12DeviceRemovedExtendedDataSettings
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.18362)
extension DeviceRemovedExtendedDataSettings.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12DeviceRemovedExtendedDataSettings}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "DeviceRemovedExtendedDataSettings")
public typealias ID3D12DeviceRemovedExtendedDataSettings = DeviceRemovedExtendedDataSettings

@available(Windows, introduced: 10.0.18362)
public extension DeviceRemovedExtendedDataSettings {
    @available(*, unavailable, renamed: "setAutoBreadcrumbsEnablement")
    func SetAutoBreadcrumbsEnablement(_ Enablement: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "setPageFaultEnablement")
    func SetPageFaultEnablement(_ Enablement: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "setWatsonDumpEnablement")
    func SetWatsonDumpEnablement(_ Enablement: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
