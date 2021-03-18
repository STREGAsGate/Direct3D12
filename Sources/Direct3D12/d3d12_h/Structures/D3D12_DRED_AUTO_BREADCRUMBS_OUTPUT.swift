/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.18362)
public struct DREDAutoBreadcrumbsOutput {
    public typealias RawValue = WinSDK.D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "DREDAutoBreadcrumbsOutput")
public typealias D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT = DREDAutoBreadcrumbsOutput

#endif
