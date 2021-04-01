/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.18362)
public class DeviceRemovedExtendedData: IUnknown {
    
    /** Retrieves the Device Removed Extended Data (DRED) auto-breadcrumbs output after device removal.
    - returns: An output parameter that takes the address of a D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT object. The object whose address is passed receives the data.
    */
    public func autoBreadcrumbsOutput() throws -> DREDAutoBreadcrumbsOutput {
        try perform(as: RawValue.self) {pThis in
            var pOutput = DREDAutoBreadcrumbsOutput.RawValue()
            try pThis.pointee.lpVtbl.pointee.GetAutoBreadcrumbsOutput(pThis, &pOutput).checkResult(self, #function)
            return DREDAutoBreadcrumbsOutput(pOutput)
        }
    }

    /** Retrieves the Device Removed Extended Data (DRED) page fault data, including matching allocation for both living and recently-deleted runtime objects. The object whose address is passed receives the data.
    - returns: An output parameter that takes the address of a D3D12_DRED_PAGE_FAULT_OUTPUT object.
    */
    public func pageFaultAllocationOutput() throws -> DREDPageFaultOutput {
        try perform(as: RawValue.self) {pThis in
            var pOutput = DREDPageFaultOutput.RawValue()
            try pThis.pointee.lpVtbl.pointee.GetPageFaultAllocationOutput(pThis, &pOutput).checkResult(self, #function)
            return DREDPageFaultOutput(pOutput)
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

@available(Windows, introduced: 10.0.18362)
extension DeviceRemovedExtendedData {
    typealias RawValue = WinSDK.ID3D12DeviceRemovedExtendedData
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.18362)
extension DeviceRemovedExtendedData.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12DeviceRemovedExtendedData}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "DeviceRemovedExtendedData")
public typealias ID3D12DeviceRemovedExtendedData = DeviceRemovedExtendedData

@available(Windows, introduced: 10.0.18362)
public extension DeviceRemovedExtendedData {
    @available(*, unavailable, renamed: "autoBreadcrumbsOutput")
    func GetAutoBreadcrumbsOutput(_ pOutput: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "pageFaultAllocationOutput")
    func GetPageFaultAllocationOutput(_ pOutput: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
