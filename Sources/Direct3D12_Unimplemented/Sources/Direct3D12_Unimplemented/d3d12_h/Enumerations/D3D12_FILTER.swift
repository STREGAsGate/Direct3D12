/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK


/// Specifies filtering options during texture sampling.
public struct Filter: OptionSet {
    public let rawValue: Int32

    ///	Use point sampling for minification, magnification, and mip-level sampling.
    public static let minMagMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MIN_MAG_MIP_POINT.rawValue)
    ///	Use point sampling for minification and magnification; use linear interpolation for mip-level sampling.
    public static let minMagPointMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MIN_MAG_POINT_MIP_LINEAR.rawValue)
    ///	Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling.
    public static let minPointMagMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MIN_POINT_MAG_MIP_LINEAR.rawValue)
    ///	Use point sampling for minification; use linear interpolation for magnification and mip-level sampling.
    public static let minPointMagLinearMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT.rawValue)
    ///	Use linear interpolation for minification; use point sampling for magnification and mip-level sampling.
    public static let minLinearMagMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MIN_LINEAR_MAG_MIP_POINT.rawValue)
    ///	Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling.
    public static let minLinearMagPointMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR.rawValue)
    ///	Use linear interpolation for minification and magnification; use point sampling for mip-level sampling.
    public static let minMagLinearMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MIN_MAG_LINEAR_MIP_POINT.rawValue)
    ///	Use linear interpolation for minification, magnification, and mip-level sampling.
    public static let minMagMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MIN_MAG_MIP_LINEAR.rawValue)
    ///	Use anisotropic interpolation for minification, magnification, and mip-level sampling.
    public static let anisotropic = Filter(rawValue: WinSDK.D3D12_FILTER_ANISOTROPIC.rawValue)
    ///	Use point sampling for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
    public static let comparisonMinMagMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_MIN_MAG_MIP_POINT.rawValue)
    ///	Use point sampling for minification and magnification; use linear interpolation for mip-level sampling. Compare the result to the comparison value.
    public static let comparisonMinMagPointMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR.rawValue)
    ///	Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling. Compare the result to the comparison value.
    public static let comparisonMinPointMagLinearMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT.rawValue)
    ///	Use point sampling for minification; use linear interpolation for magnification and mip-level sampling. Compare the result to the comparison value.
    public static let comparisonMinPointMagMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR.rawValue)
    ///	Use linear interpolation for minification; use point sampling for magnification and mip-level sampling. Compare the result to the comparison value.
    public static let comparisonMinLinearMagMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT.rawValue)
    ///	Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling. Compare the result to the comparison value.
    public static let comparisonMinLinearMagPointMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR.rawValue)
    ///	Use linear interpolation for minification and magnification; use point sampling for mip-level sampling. Compare the result to the comparison value.
    public static let comparisonMinMagLinearMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT.rawValue)
    ///	Use linear interpolation for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
    public static let comparisonMinMagMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR.rawValue)
    ///	Use anisotropic interpolation for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
    public static let comparisonAnisotropic = Filter(rawValue: WinSDK.D3D12_FILTER_COMPARISON_ANISOTROPIC.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_MAG_MIP_POINT and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumMinMagMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_MIN_MAG_MIP_POINT.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_MAG_POINT_MIP_LINEAR and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumMinMagPointMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumMinPointMagLinearMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_POINT_MAG_MIP_LINEAR and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumMinPointMagMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_LINEAR_MAG_MIP_POINT and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumMinLinearMagMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumMinLinearMagPointMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_MAG_LINEAR_MIP_POINT and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumMinMagLinearMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_MAG_MIP_LINEAR and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumMinMagMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_MIN_MAG_MIP_LINEAR.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_ANISOTROPIC and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let minimumAnisotropic = Filter(rawValue: WinSDK.D3D12_FILTER_MINIMUM_ANISOTROPIC.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_MAG_MIP_POINT and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumMinMagMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_MIN_MAG_MIP_POINT.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_MAG_POINT_MIP_LINEAR and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumMinMagPointMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumMinPointMagLinearMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_POINT_MAG_MIP_LINEAR and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumMinPointMagMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_LINEAR_MAG_MIP_POINT and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumMinLinearMagMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumMinLinearMagPointMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_MAG_LINEAR_MIP_POINT and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumMinMagLinearMipPoint = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_MIN_MAG_MIP_LINEAR and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumMinMagMipLinear = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR.rawValue)
    ///	Fetch the same set of texels as D3D12_FILTER_ANISOTROPIC and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
    public static let maximumAnisotropic = Filter(rawValue: WinSDK.D3D12_FILTER_MAXIMUM_ANISOTROPIC.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Filter")
public typealias D3D12_FILTER  = Filter

public extension Filter {
    @available(*, deprecated, renamed: "minMagMipPoint")
    static let D3D12_FILTER_MIN_MAG_MIP_POINT = Self.minMagMipPoint

    @available(*, deprecated, renamed: "minMagPointMipLinear")
    static let D3D12_FILTER_MIN_MAG_POINT_MIP_LINEAR = Self.minMagPointMipLinear

    @available(*, deprecated, renamed: "minPointMagMipLinear")
    static let D3D12_FILTER_MIN_POINT_MAG_MIP_LINEAR = Self.minPointMagMipLinear

    @available(*, deprecated, renamed: "minPointMagLinearMipPoint")
    static let D3D12_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT = Self.minPointMagLinearMipPoint

    @available(*, deprecated, renamed: "minLinearMagMipPoint")
    static let D3D12_FILTER_MIN_LINEAR_MAG_MIP_POINT = Self.minLinearMagMipPoint
    
    @available(*, deprecated, renamed: "minLinearMagPointMipLinear")
    static let D3D12_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR = Self.minLinearMagPointMipLinear
    
    @available(*, deprecated, renamed: "minMagLinearMipPoint")
    static let D3D12_FILTER_MIN_MAG_LINEAR_MIP_POINT = Self.minMagLinearMipPoint
    
    @available(*, deprecated, renamed: "minMagMipLinear")
    static let D3D12_FILTER_MIN_MAG_MIP_LINEAR = Self.minMagMipLinear
    
    @available(*, deprecated, renamed: "anisotropic")
    static let D3D12_FILTER_ANISOTROPIC = Self.anisotropic
    
    @available(*, deprecated, renamed: "comparisonMinMagMipPoint")
    static let D3D12_FILTER_COMPARISON_MIN_MAG_MIP_POINT = Self.comparisonMinMagMipPoint
    
    @available(*, deprecated, renamed: "comparisonMinMagPointMipLinear")
    static let D3D12_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR = Self.comparisonMinMagPointMipLinear
        
    @available(*, deprecated, renamed: "comparisonMinPointMagLinearMipPoint")
    static let D3D12_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT = Self.comparisonMinPointMagLinearMipPoint
        
    @available(*, deprecated, renamed: "comparisonMinPointMagMipLinear")
    static let D3D12_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR = Self.comparisonMinPointMagMipLinear
        
    @available(*, deprecated, renamed: "comparisonMinLinearMagMipPoint")
    static let D3D12_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT = Self.comparisonMinLinearMagMipPoint
        
    @available(*, deprecated, renamed: "comparisonMinLinearMagPointMipLinear")
    static let D3D12_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR = Self.comparisonMinLinearMagPointMipLinear
        
    @available(*, deprecated, renamed: "comparisonMinMagLinearMipPoint")
    static let D3D12_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT = Self.comparisonMinMagLinearMipPoint
        
    @available(*, deprecated, renamed: "comparisonMinMagMipLinear")
    static let D3D12_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR = Self.comparisonMinMagMipLinear
        
    @available(*, deprecated, renamed: "comparisonAnisotropic")
    static let D3D12_FILTER_COMPARISON_ANISOTROPIC = Self.comparisonAnisotropic
        
    @available(*, deprecated, renamed: "minimumMinMagMipPoint")
    static let D3D12_FILTER_MINIMUM_MIN_MAG_MIP_POINT = Self.minimumMinMagMipPoint
        
    @available(*, deprecated, renamed: "minimumMinMagPointMipLinear")
    static let D3D12_FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR = Self.minimumMinMagPointMipLinear
        
    @available(*, deprecated, renamed: "minimumMinPointMagLinearMipPoint")
    static let D3D12_FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT = Self.minimumMinPointMagLinearMipPoint
        
    @available(*, deprecated, renamed: "minimumMinPointMagMipLinear")
    static let D3D12_FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR = Self.minimumMinPointMagMipLinear
        
    @available(*, deprecated, renamed: "minimumMinLinearMagMipPoint")
    static let D3D12_FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT = Self.minimumMinLinearMagMipPoint
        
    @available(*, deprecated, renamed: "minimumMinLinearMagPointMipLinear")
    static let D3D12_FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR = Self.minimumMinLinearMagPointMipLinear
        
    @available(*, deprecated, renamed: "minimumMinMagLinearMipPoint")
    static let D3D12_FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT = Self.minimumMinMagLinearMipPoint
        
    @available(*, deprecated, renamed: "minimumMinMagMipLinear")
    static let D3D12_FILTER_MINIMUM_MIN_MAG_MIP_LINEAR = Self.minimumMinMagMipLinear
        
    @available(*, deprecated, renamed: "minimumAnisotropic")
    static let D3D12_FILTER_MINIMUM_ANISOTROPIC = Self.minimumAnisotropic
        
    @available(*, deprecated, renamed: "maximumMinMagMipPoint")
    static let D3D12_FILTER_MAXIMUM_MIN_MAG_MIP_POINT = Self.maximumMinMagMipPoint
        
    @available(*, deprecated, renamed: "maximumMinMagPointMipLinear")
    static let D3D12_FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR = Self.maximumMinMagPointMipLinear
        
    @available(*, deprecated, renamed: "maximumMinPointMagLinearMipPoint")
    static let D3D12_FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT = Self.maximumMinPointMagLinearMipPoint
       
    @available(*, deprecated, renamed: "maximumMinPointMagMipLinear")
    static let D3D12_FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR = Self.maximumMinPointMagMipLinear
       
    @available(*, deprecated, renamed: "maximumMinLinearMagMipPoint")
    static let D3D12_FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT = Self.maximumMinLinearMagMipPoint
       
    @available(*, deprecated, renamed: "maximumMinLinearMagPointMipLinear")
    static let D3D12_FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR = Self.maximumMinLinearMagPointMipLinear
       
    @available(*, deprecated, renamed: "maximumMinMagLinearMipPoint")
    static let D3D12_FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT = Self.maximumMinMagLinearMipPoint
       
    @available(*, deprecated, renamed: "maximumMinMagMipLinear")
    static let D3D12_FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR = Self.maximumMinMagMipLinear
       
    @available(*, deprecated, renamed: "maximumAnisotropic")
    static let D3D12_FILTER_MAXIMUM_ANISOTROPIC = Self.maximumAnisotropic
}

#endif
