/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct DREDAutoBreadcrumbsOutput {
    internal var rawValue: WinSDK.D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT


    internal init(_ rawValue: WinSDK.D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DREDAutoBreadcrumbsOutput")
public typealias D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT = DREDAutoBreadcrumbsOutput

#endif
