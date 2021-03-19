/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Resource data formats, including fully-typed and typeless formats. A list of modifiers at the bottom of the page more fully describes each format type.
public enum Format {
    public typealias RawValue = WinSDK.DXGI_FORMAT
    ///	The format is not known.
    case unknown
    ///	A four-component, 128-bit typeless format that supports 32 bits per channel including alpha. ¹
    case r32g32b32a32Typeless
    ///	A four-component, 128-bit floating-point format that supports 32 bits per channel including alpha. 1,5,8
    case r32g32b32a32Float
    ///	A four-component, 128-bit unsigned-integer format that supports 32 bits per channel including alpha. ¹
    case r32g32b32a32UInt
    ///	A four-component, 128-bit signed-integer format that supports 32 bits per channel including alpha. ¹
    case r32g32b32a32Int
    ///	A three-component, 96-bit typeless format that supports 32 bits per color channel.
    case r32g32b32Typeless
    ///	A three-component, 96-bit floating-point format that supports 32 bits per color channel.5,8
    case r32g32b32Float
    ///	A three-component, 96-bit unsigned-integer format that supports 32 bits per color channel.
    case r32g32b32UInt	
    ///A three-component, 96-bit signed-integer format that supports 32 bits per color channel.
    case r32g32b32Int
    ///	A four-component, 64-bit typeless format that supports 16 bits per channel including alpha.
    case r16g16b16a16Typeless
    ///	A four-component, 64-bit floating-point format that supports 16 bits per channel including alpha.5,7
    case r16g16b16a16Float
    ///	A four-component, 64-bit unsigned-normalized-integer format that supports 16 bits per channel including alpha.
    case r16g16b16a16Unorm
    ///	A four-component, 64-bit unsigned-integer format that supports 16 bits per channel including alpha.
    case r16g16b16a16UInt
    ///	A four-component, 64-bit signed-normalized-integer format that supports 16 bits per channel including alpha.
    case r16g16b16a16Snorm
    ///	A four-component, 64-bit signed-integer format that supports 16 bits per channel including alpha.
    case r16g16b16a16Int
    ///	A two-component, 64-bit typeless format that supports 32 bits for the red channel and 32 bits for the green channel.
    case r32g32Typeless	
    /// A two-component, 64-bit floating-point format that supports 32 bits for the red channel and 32 bits for the green channel.5,8
    case r32g32Float	
    /// A two-component, 64-bit unsigned-integer format that supports 32 bits for the red channel and 32 bits for the green channel.
    case r32g32UInt	
    /// A two-component, 64-bit signed-integer format that supports 32 bits for the red channel and 32 bits for the green channel.
    case r32g32Int
    ///	A two-component, 64-bit typeless format that supports 32 bits for the red channel, 8 bits for the green channel, and 24 bits are unused.
    case r32g8x24Typeless
    ///	A 32-bit floating-point component, and two unsigned-integer components (with an additional 32 bits). This format supports 32-bit depth, 8-bit stencil, and 24 bits are unused.⁵
    case d32FloatS8x24UInt
    ///	A 32-bit floating-point component, and two typeless components (with an additional 32 bits). This format supports 32-bit red channel, 8 bits are unused, and 24 bits are unused.⁵
    case r32FloatX8x24Typeless
    ///	A 32-bit typeless component, and two unsigned-integer components (with an additional 32 bits). This format has 32 bits unused, 8 bits for green channel, and 24 bits are unused.
    case x32TypelessG8x24UInt
    ///	A four-component, 32-bit typeless format that supports 10 bits for each color and 2 bits for alpha.
    case r10g10b10a2Typeless
    ///	A four-component, 32-bit unsigned-normalized-integer format that supports 10 bits for each color and 2 bits for alpha.
    case r10g10b10a2Unorm
    ///	A four-component, 32-bit unsigned-integer format that supports 10 bits for each color and 2 bits for alpha.
    case r10g10b10a2UInt
    /**	
        Three partial-precision floating-point numbers encoded into a single 32-bit value (a variant of s10e5, which is sign bit, 10-bit mantissa, and 5-bit biased (15) exponent).
        There are no sign bits, and there is a 5-bit biased (15) exponent for each channel, 6-bit mantissa for R and G, and a 5-bit mantissa for B, as shown in the following illustration.5,7

        Illustration of the bits in the three partial-precision floating-point numbers
    */
    case r11g11b10Float
    ///	A four-component, 32-bit typeless format that supports 8 bits per channel including alpha.
    case r8g8b8a8Typeless
    ///	A four-component, 32-bit unsigned-normalized-integer format that supports 8 bits per channel including alpha.
    case r8g8b8a8Unorm
    ///	A four-component, 32-bit unsigned-normalized integer sRGB format that supports 8 bits per channel including alpha.
    case r8g8b8a8UnormSRGB
    ///	A four-component, 32-bit unsigned-integer format that supports 8 bits per channel including alpha.
    case r8g8b8a8UInt
    ///	A four-component, 32-bit signed-normalized-integer format that supports 8 bits per channel including alpha.
    case r8g8b8a8Snorm
    ///	A four-component, 32-bit signed-integer format that supports 8 bits per channel including alpha.
    case r8g8b8a8Int
    ///	A two-component, 32-bit typeless format that supports 16 bits for the red channel and 16 bits for the green channel.
    case r16g16Typeless
    ///	A two-component, 32-bit floating-point format that supports 16 bits for the red channel and 16 bits for the green channel.5,7
    case r16g16Float
    ///	A two-component, 32-bit unsigned-normalized-integer format that supports 16 bits each for the green and red channels.
    case r16g16Unorm
    ///	A two-component, 32-bit unsigned-integer format that supports 16 bits for the red channel and 16 bits for the green channel.
    case r16g16UInt
    ///	A two-component, 32-bit signed-normalized-integer format that supports 16 bits for the red channel and 16 bits for the green channel.
    case r16g16Snorm
    ///	A two-component, 32-bit signed-integer format that supports 16 bits for the red channel and 16 bits for the green channel.
    case r16g16Int
    ///	A single-component, 32-bit typeless format that supports 32 bits for the red channel.
    case r32Typeless
    ///	A single-component, 32-bit floating-point format that supports 32 bits for depth.5,8
    case d32Float
    ///	A single-component, 32-bit floating-point format that supports 32 bits for the red channel.5,8
    case r32Float
    ///	A single-component, 32-bit unsigned-integer format that supports 32 bits for the red channel.
    case r32UInt
    ///	A single-component, 32-bit signed-integer format that supports 32 bits for the red channel.
    case r32Int
    ///	A two-component, 32-bit typeless format that supports 24 bits for the red channel and 8 bits for the green channel.
    case r24g8Typeless
    ///	A 32-bit z-buffer format that supports 24 bits for depth and 8 bits for stencil.
    case d24UnormS8UInt
    ///	A 32-bit format, that contains a 24 bit, single-component, unsigned-normalized integer, with an additional typeless 8 bits. This format has 24 bits red channel and 8 bits unused.
    case r24UnormX8Typeless
    ///	A 32-bit format, that contains a 24 bit, single-component, typeless format, with an additional 8 bit unsigned integer component. This format has 24 bits unused and 8 bits green channel.
    case x24TypelessG8UInt
    ///	A two-component, 16-bit typeless format that supports 8 bits for the red channel and 8 bits for the green channel.
    case r8g8Typeless
    ///	A two-component, 16-bit unsigned-normalized-integer format that supports 8 bits for the red channel and 8 bits for the green channel.
    case r8g8Unorm
    ///	A two-component, 16-bit unsigned-integer format that supports 8 bits for the red channel and 8 bits for the green channel.
    case r8g8UInt
    ///	A two-component, 16-bit signed-normalized-integer format that supports 8 bits for the red channel and 8 bits for the green channel.
    case r8g8Snorm
    ///	A two-component, 16-bit signed-integer format that supports 8 bits for the red channel and 8 bits for the green channel.
    case r8g8Int
    ///	A single-component, 16-bit typeless format that supports 16 bits for the red channel.
    case r16Typeless
    ///	A single-component, 16-bit floating-point format that supports 16 bits for the red channel.5,7
    case r16Float
    ///	A single-component, 16-bit unsigned-normalized-integer format that supports 16 bits for depth.
    case d16Unorm
    ///	A single-component, 16-bit unsigned-normalized-integer format that supports 16 bits for the red channel.
    case r16Unorm
    ///	A single-component, 16-bit unsigned-integer format that supports 16 bits for the red channel.
    case r16UInt
    ///	A single-component, 16-bit signed-normalized-integer format that supports 16 bits for the red channel.
    case r16Snorm
    ///	A single-component, 16-bit signed-integer format that supports 16 bits for the red channel.
    case r16Int
    ///	A single-component, 8-bit typeless format that supports 8 bits for the red channel.
    case r8Typeless
    ///	A single-component, 8-bit unsigned-normalized-integer format that supports 8 bits for the red channel.
    case r8Unorm
    ///	A single-component, 8-bit unsigned-integer format that supports 8 bits for the red channel.
    case r8UInt
    ///	A single-component, 8-bit signed-normalized-integer format that supports 8 bits for the red channel.
    case r8Snorm
    ///	A single-component, 8-bit signed-integer format that supports 8 bits for the red channel.
    case r8Int
    ///	A single-component, 8-bit unsigned-normalized-integer format for alpha only.
    case a8Unorm
    ///	A single-component, 1-bit unsigned-normalized integer format that supports 1 bit for the red channel. ².
    case r1Unorm
    /**	
        Three partial-precision floating-point numbers encoded into a single 32-bit value all sharing the same 5-bit exponent (variant of s10e5, which is sign bit, 10-bit mantissa, and 5-bit biased (15) exponent).
        There is no sign bit, and there is a shared 5-bit biased (15) exponent and a 9-bit mantissa for each channel, as shown in the following illustration. 6,7.

        Illustration of the bits in the three partial-precision floating-point numbers
    */
    case r9g9b9e5SharedEXP
    /**
        A four-component, 32-bit unsigned-normalized-integer format. This packed RGB format is analogous to the UYVY format. Each 32-bit block describes a pair of pixels: (R8, G8, B8) and (R8, G8, B8) where the R8/B8 values are repeated, and the G8 values are unique to each pixel. ³

        Width must be even.
    */
    case r8g8B8g8Unorm
    /**
        A four-component, 32-bit unsigned-normalized-integer format. This packed RGB format is analogous to the YUY2 format. Each 32-bit block describes a pair of pixels: (R8, G8, B8) and (R8, G8, B8) where the R8/B8 values are repeated, and the G8 values are unique to each pixel. ³

        Width must be even.
    */
    case g8r8G8b8Unorm
    ///	Four-component typeless block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc1Typeless
    ///	Four-component block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc1Unorm
    ///	Four-component block-compression format for sRGB data. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc1UnormSRGB
    ///	Four-component typeless block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc2Typeless
    ///	Four-component block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc2Unorm
    ///	Four-component block-compression format for sRGB data. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc2UnormSRGB
    ///	Four-component typeless block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc3Typeless
    ///	Four-component block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc3Unorm
    ///	Four-component block-compression format for sRGB data. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc3UnormSRGB
    ///	One-component typeless block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc4Typeless
    ///	One-component block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc4Unorm
    ///	One-component block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc4Snorm
    ///	Two-component typeless block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc5Typeless
    ///	Two-component block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc5Unorm
    ///	Two-component block-compression format. For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc5Snorm
    /**
        A three-component, 16-bit unsigned-normalized-integer format that supports 5 bits for blue, 6 bits for green, and 5 bits for red.

        Direct3D 10 through Direct3D 11:  This value is defined for DXGI. However, Direct3D 10, 10.1, or 11 devices do not support this format.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case b5g6r5Unorm
    /**
        A four-component, 16-bit unsigned-normalized-integer format that supports 5 bits for each color channel and 1-bit alpha.

        Direct3D 10 through Direct3D 11:  This value is defined for DXGI. However, Direct3D 10, 10.1, or 11 devices do not support this format.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case b5g5r5a1Unorm
    ///	A four-component, 32-bit unsigned-normalized-integer format that supports 8 bits for each color channel and 8-bit alpha.
    case b8g8r8a8Unorm
    ///	A four-component, 32-bit unsigned-normalized-integer format that supports 8 bits for each color channel and 8 bits unused.
    case b8g8r8x8Unorm
    ///	A four-component, 32-bit 2.8-biased fixed-point format that supports 10 bits for each color channel and 2-bit alpha.
    case r10g10b10XrBiasA2Unorm
    ///	A four-component, 32-bit typeless format that supports 8 bits for each channel including alpha. ⁴
    case b8g8r8a8Typeless
    ///	A four-component, 32-bit unsigned-normalized standard RGB format that supports 8 bits for each channel including alpha. ⁴
    case b8g8r8a8UnormSRGB
    ///	A four-component, 32-bit typeless format that supports 8 bits for each color channel, and 8 bits are unused. ⁴
    case b8g8r8x8Typeless
    ///	A four-component, 32-bit unsigned-normalized standard RGB format that supports 8 bits for each color channel, and 8 bits are unused. ⁴
    case b8g8r8x8UnormSRGB
    ///	A typeless block-compression format. ⁴ For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc6hTypeless
    ///	A block-compression format. ⁴ For information about block-compression formats, see Texture Block Compression in Direct3D 11.⁵
    case bc6hUf16
    ///	A block-compression format. ⁴ For information about block-compression formats, see Texture Block Compression in Direct3D 11.⁵
    case bc6hSf16
    ///	A typeless block-compression format. ⁴ For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc7Typeless
    ///	A block-compression format. ⁴ For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc7Unorm
    ///	A block-compression format. ⁴ For information about block-compression formats, see Texture Block Compression in Direct3D 11.
    case bc7UnormSRGB
    /**
        Most common YUV 4:4:4 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R8G8B8A8_UNORM and DXGI_FORMAT_R8G8B8A8_UINT. For UAVs, an additional valid view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R8G8B8A8_UNORM and DXGI_FORMAT_R8G8B8A8_UINT. Supported view types are SRV, RTV, and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is V->R8,
        U->G8,
        Y->B8,
        and A->A8.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case ayuv
    /**
        10-bit per channel packed YUV 4:4:4 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R10G10B10A2_UNORM and DXGI_FORMAT_R10G10B10A2_UINT. For UAVs, an additional valid view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R10G10B10A2_UNORM and DXGI_FORMAT_R10G10B10A2_UINT. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is U->R10,
        Y->G10,
        V->B10,
        and A->A2.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case y410
    /**
        16-bit per channel packed YUV 4:4:4 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R16G16B16A16_UNORM and DXGI_FORMAT_R16G16B16A16_UINT. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is U->R16,
        Y->G16,
        V->B16,
        and A->A16.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case y416
    /**
        Most common YUV 4:2:0 video resource format. Valid luminance data view formats for this video resource format are DXGI_FORMAT_R8_UNORM and DXGI_FORMAT_R8_UINT. Valid chrominance data view formats (width and height are each 1/2 of luminance view) for this video resource format are DXGI_FORMAT_R8G8_UNORM and DXGI_FORMAT_R8G8_UINT. Supported view types are SRV, RTV, and UAV. For luminance data view, the mapping to the view channel is Y->R8. For chrominance data view, the mapping to the view channel is U->R8 and
        V->G8.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Width and height must be even. Direct3D 11 staging resources and initData parameters for this format use (rowPitch * (height + (height / 2))) bytes. The first (SysMemPitch * height) bytes are the Y plane, the remaining (SysMemPitch * (height / 2)) bytes are the UV plane.

        An app using the YUY 4:2:0 formats must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling ID3D12Device::CreateShaderResourceView twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case nv12
    /**
        10-bit per channel planar YUV 4:2:0 video resource format. Valid luminance data view formats for this video resource format are DXGI_FORMAT_R16_UNORM and DXGI_FORMAT_R16_UINT. The runtime does not enforce whether the lowest 6 bits are 0 (given that this video resource format is a 10-bit format that uses 16 bits). If required, application shader code would have to enforce this manually. From the runtime's point of view, DXGI_FORMAT_P010 is no different than DXGI_FORMAT_P016. Valid chrominance data view formats (width and height are each 1/2 of luminance view) for this video resource format are DXGI_FORMAT_R16G16_UNORM and DXGI_FORMAT_R16G16_UINT. For UAVs, an additional valid chrominance data view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R16G16_UNORM and DXGI_FORMAT_R16G16_UINT. Supported view types are SRV, RTV, and UAV. For luminance data view, the mapping to the view channel is Y->R16. For chrominance data view, the mapping to the view channel is U->R16 and
        V->G16.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Width and height must be even. Direct3D 11 staging resources and initData parameters for this format use (rowPitch * (height + (height / 2))) bytes. The first (SysMemPitch * height) bytes are the Y plane, the remaining (SysMemPitch * (height / 2)) bytes are the UV plane.

        An app using the YUY 4:2:0 formats must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling ID3D12Device::CreateShaderResourceView twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case p010
    /**
        16-bit per channel planar YUV 4:2:0 video resource format. Valid luminance data view formats for this video resource format are DXGI_FORMAT_R16_UNORM and DXGI_FORMAT_R16_UINT. Valid chrominance data view formats (width and height are each 1/2 of luminance view) for this video resource format are DXGI_FORMAT_R16G16_UNORM and DXGI_FORMAT_R16G16_UINT. For UAVs, an additional valid chrominance data view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R16G16_UNORM and DXGI_FORMAT_R16G16_UINT. Supported view types are SRV, RTV, and UAV. For luminance data view, the mapping to the view channel is Y->R16. For chrominance data view, the mapping to the view channel is U->R16 and
        V->G16.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Width and height must be even. Direct3D 11 staging resources and initData parameters for this format use (rowPitch * (height + (height / 2))) bytes. The first (SysMemPitch * height) bytes are the Y plane, the remaining (SysMemPitch * (height / 2)) bytes are the UV plane.

        An app using the YUY 4:2:0 formats must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling ID3D12Device::CreateShaderResourceView twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case p016
    /**
        8-bit per channel planar YUV 4:2:0 video resource format. This format is subsampled where each pixel has its own Y value, but each 2x2 pixel block shares a single U and V value. The runtime requires that the width and height of all resources that are created with this format are multiples of 2. The runtime also requires that the left, right, top, and bottom members of any RECT that are used for this format are multiples of 2. This format differs from DXGI_FORMAT_NV12 in that the layout of the data within the resource is completely opaque to applications. Applications cannot use the CPU to map the resource and then access the data within the resource. You cannot use shaders with this format. Because of this behavior, legacy hardware that supports a non-NV12 4:2:0 layout (for example, YV12, and so on) can be used. Also, new hardware that has a 4:2:0 implementation better than NV12 can be used when the application does not need the data to be in a standard layout.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Width and height must be even. Direct3D 11 staging resources and initData parameters for this format use (rowPitch * (height + (height / 2))) bytes.

        An app using the YUY 4:2:0 formats must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling ID3D12Device::CreateShaderResourceView twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case opaque420
    /**
        Most common YUV 4:2:2 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R8G8B8A8_UNORM and DXGI_FORMAT_R8G8B8A8_UINT. For UAVs, an additional valid view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R8G8B8A8_UNORM and DXGI_FORMAT_R8G8B8A8_UINT. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is Y0->R8,
        U0->G8,
        Y1->B8,
        and V0->A8.

        A unique valid view format for this video resource format is DXGI_FORMAT_R8G8_B8G8_UNORM. With this view format, the width of the view appears to be twice what the DXGI_FORMAT_R8G8B8A8_UNORM or DXGI_FORMAT_R8G8B8A8_UINT view would be when hardware reconstructs RGBA automatically on read and before filtering. This Direct3D hardware behavior is legacy and is likely not useful any more. With this view format, the mapping to the view channel is Y0->R8,
        U0->
        G8[0],
        Y1->B8,
        and V0->
        G8[1].

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Width must be even.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case yuy2
    /**
        10-bit per channel packed YUV 4:2:2 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R16G16B16A16_UNORM and DXGI_FORMAT_R16G16B16A16_UINT. The runtime does not enforce whether the lowest 6 bits are 0 (given that this video resource format is a 10-bit format that uses 16 bits). If required, application shader code would have to enforce this manually. From the runtime's point of view, DXGI_FORMAT_Y210 is no different than DXGI_FORMAT_Y216. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is Y0->R16,
        U->G16,
        Y1->B16,
        and V->A16.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Width must be even.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case y210
    /**
        16-bit per channel packed YUV 4:2:2 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R16G16B16A16_UNORM and DXGI_FORMAT_R16G16B16A16_UINT. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is Y0->R16,
        U->G16,
        Y1->B16,
        and V->A16.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Width must be even.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case y216
    /**
        Most common planar YUV 4:1:1 video resource format. Valid luminance data view formats for this video resource format are DXGI_FORMAT_R8_UNORM and DXGI_FORMAT_R8_UINT. Valid chrominance data view formats (width and height are each 1/4 of luminance view) for this video resource format are DXGI_FORMAT_R8G8_UNORM and DXGI_FORMAT_R8G8_UINT. Supported view types are SRV, RTV, and UAV. For luminance data view, the mapping to the view channel is Y->R8. For chrominance data view, the mapping to the view channel is U->R8 and
        V->G8.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Width must be a multiple of 4. Direct3D11 staging resources and initData parameters for this format use (rowPitch * height * 2) bytes. The first (SysMemPitch * height) bytes are the Y plane, the next ((SysMemPitch / 2) * height) bytes are the UV plane, and the remainder is padding.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case nv11
    /**
        4-bit palletized YUV format that is commonly used for DVD subpicture.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case ai44
    /**
        4-bit palletized YUV format that is commonly used for DVD subpicture.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case ia44
    /**
        8-bit palletized format that is used for palletized RGB data when the processor processes ISDB-T data and for palletized YUV data when the processor processes BluRay data.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case p8
    /**
        8-bit palletized format with 8 bits of alpha that is used for palletized YUV data when the processor processes BluRay data.

        For more info about YUV formats for video rendering, see Recommended 8-Bit YUV Formats for Video Rendering.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case a8p8
    /**
        A four-component, 16-bit unsigned-normalized integer format that supports 4 bits for each channel including alpha.

        Direct3D 11.1:  This value is not supported until Windows 8.
    */
    case b4g4r4a4Unorm
    ///	A video format; an 8-bit version of a hybrid planar 4:2:2 format.
    case p208
    ///	An 8 bit YCbCrA 4:4 rendering format.
    case v208
    ///	An 8 bit YCbCrA 4:4:4:4 rendering format.
    case v408
    /// Forces this enumeration to compile to 32 bits in size. Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits. This value is not used.
    case forceUInt

    /// This Swift Package had no implementation, this can happen if the Base API is expanded.
    case _unimplemented(RawValue)

    public var rawValue: RawValue {
        switch self {
        case .unknown:
            return WinSDK.DXGI_FORMAT_UNKNOWN
        case .r32g32b32a32Typeless:
            return WinSDK.DXGI_FORMAT_R32G32B32A32_TYPELESS
        case .r32g32b32a32Float:
            return WinSDK.DXGI_FORMAT_R32G32B32A32_FLOAT
        case .r32g32b32a32UInt:
            return WinSDK.DXGI_FORMAT_R32G32B32A32_UINT
        case .r32g32b32a32Int:
            return WinSDK.DXGI_FORMAT_R32G32B32A32_SINT
        case .r32g32b32Typeless:
            return WinSDK.DXGI_FORMAT_R32G32B32_TYPELESS
        case .r32g32b32Float:
            return WinSDK.DXGI_FORMAT_R32G32B32_FLOAT
        case .r32g32b32UInt:
            return WinSDK.DXGI_FORMAT_R32G32B32_UINT
        case .r32g32b32Int:
            return WinSDK.DXGI_FORMAT_R32G32B32_SINT
        case .r16g16b16a16Typeless:
            return WinSDK.DXGI_FORMAT_R16G16B16A16_TYPELESS
        case .r16g16b16a16Float:
            return WinSDK.DXGI_FORMAT_R16G16B16A16_FLOAT
        case .r16g16b16a16Unorm:
            return WinSDK.DXGI_FORMAT_R16G16B16A16_UNORM
        case .r16g16b16a16UInt:
            return WinSDK.DXGI_FORMAT_R16G16B16A16_UINT
        case .r16g16b16a16Snorm:
            return WinSDK.DXGI_FORMAT_R16G16B16A16_SNORM
        case .r16g16b16a16Int:
            return WinSDK.DXGI_FORMAT_R16G16B16A16_SINT
        case .r32g32Typeless:
            return WinSDK.DXGI_FORMAT_R32G32_TYPELESS
        case .r32g32Float:
            return WinSDK.DXGI_FORMAT_R32G32_FLOAT
        case .r32g32UInt:
            return WinSDK.DXGI_FORMAT_R32G32_UINT
        case .r32g32Int:
            return WinSDK.DXGI_FORMAT_R32G32_SINT
        case .r32g8x24Typeless:
            return WinSDK.DXGI_FORMAT_R32G8X24_TYPELESS
        case .d32FloatS8x24UInt:
            return WinSDK.DXGI_FORMAT_D32_FLOAT_S8X24_UINT
        case .r32FloatX8x24Typeless:
            return WinSDK.DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS
        case .x32TypelessG8x24UInt:
            return WinSDK.DXGI_FORMAT_X32_TYPELESS_G8X24_UINT
        case .r10g10b10a2Typeless:
            return WinSDK.DXGI_FORMAT_R10G10B10A2_TYPELESS
        case .r10g10b10a2Unorm:
            return WinSDK.DXGI_FORMAT_R10G10B10A2_UNORM
        case .r10g10b10a2UInt:
            return WinSDK.DXGI_FORMAT_R10G10B10A2_UINT
        case .r11g11b10Float:
            return WinSDK.DXGI_FORMAT_R11G11B10_FLOAT
        case .r8g8b8a8Typeless:
            return WinSDK.DXGI_FORMAT_R8G8B8A8_TYPELESS
        case .r8g8b8a8Unorm:
            return WinSDK.DXGI_FORMAT_R8G8B8A8_UNORM
        case .r8g8b8a8UnormSRGB:
            return WinSDK.DXGI_FORMAT_R8G8B8A8_UNORM_SRGB
        case .r8g8b8a8UInt:
            return WinSDK.DXGI_FORMAT_R8G8B8A8_UINT
        case .r8g8b8a8Snorm:
            return WinSDK.DXGI_FORMAT_R8G8B8A8_SNORM
        case .r8g8b8a8Int:
            return WinSDK.DXGI_FORMAT_R8G8B8A8_SINT
        case .r16g16Typeless:
            return WinSDK.DXGI_FORMAT_R16G16_TYPELESS
        case .r16g16Float:
            return WinSDK.DXGI_FORMAT_R16G16_FLOAT
        case .r16g16Unorm:
            return WinSDK.DXGI_FORMAT_R16G16_UNORM
        case .r16g16UInt:
            return WinSDK.DXGI_FORMAT_R16G16_UINT
        case .r16g16Snorm:
            return WinSDK.DXGI_FORMAT_R16G16_SNORM
        case .r16g16Int:
            return WinSDK.DXGI_FORMAT_R16G16_SINT
        case .r32Typeless:
            return WinSDK.DXGI_FORMAT_R32_TYPELESS
        case .d32Float:
            return WinSDK.DXGI_FORMAT_D32_FLOAT
        case .r32Float:
            return WinSDK.DXGI_FORMAT_R32_FLOAT
        case .r32UInt:
            return WinSDK.DXGI_FORMAT_R32_UINT
        case .r32Int:
            return WinSDK.DXGI_FORMAT_R32_SINT
        case .r24g8Typeless:
            return WinSDK.DXGI_FORMAT_R24G8_TYPELESS
        case .d24UnormS8UInt:
            return WinSDK.DXGI_FORMAT_D24_UNORM_S8_UINT
        case .r24UnormX8Typeless:
            return WinSDK.DXGI_FORMAT_R24_UNORM_X8_TYPELESS
        case .x24TypelessG8UInt:
            return WinSDK.DXGI_FORMAT_X24_TYPELESS_G8_UINT
        case .r8g8Typeless:
            return WinSDK.DXGI_FORMAT_R8G8_TYPELESS
        case .r8g8Unorm:
            return WinSDK.DXGI_FORMAT_R8G8_UNORM
        case .r8g8UInt:
            return WinSDK.DXGI_FORMAT_R8G8_UINT
        case .r8g8Snorm:
            return WinSDK.DXGI_FORMAT_R8G8_SNORM
        case .r8g8Int:
            return WinSDK.DXGI_FORMAT_R8G8_SINT
        case .r16Typeless:
            return WinSDK.DXGI_FORMAT_R16_TYPELESS
        case .r16Float:
            return WinSDK.DXGI_FORMAT_R16_FLOAT
        case .d16Unorm:
            return WinSDK.DXGI_FORMAT_D16_UNORM
        case .r16Unorm:
            return WinSDK.DXGI_FORMAT_R16_UNORM
        case .r16UInt:
            return WinSDK.DXGI_FORMAT_R16_UINT
        case .r16Snorm:
            return WinSDK.DXGI_FORMAT_R16_SNORM
        case .r16Int:
            return WinSDK.DXGI_FORMAT_R16_SINT
        case .r8Typeless:
            return WinSDK.DXGI_FORMAT_R8_TYPELESS
        case .r8Unorm:
            return WinSDK.DXGI_FORMAT_R8_UNORM
        case .r8UInt:
            return WinSDK.DXGI_FORMAT_R8_UINT
        case .r8Snorm:
            return WinSDK.DXGI_FORMAT_R8_SNORM
        case .r8Int:
            return WinSDK.DXGI_FORMAT_R8_SINT
        case .a8Unorm:
            return WinSDK.DXGI_FORMAT_A8_UNORM
        case .r1Unorm:
            return WinSDK.DXGI_FORMAT_R1_UNORM
        case .r9g9b9e5SharedEXP:
            return WinSDK.DXGI_FORMAT_R9G9B9E5_SHAREDEXP
        case .r8g8B8g8Unorm:
            return WinSDK.DXGI_FORMAT_R8G8_B8G8_UNORM
        case .g8r8G8b8Unorm:
            return WinSDK.DXGI_FORMAT_G8R8_G8B8_UNORM
        case .bc1Typeless:
            return WinSDK.DXGI_FORMAT_BC1_TYPELESS
        case .bc1Unorm:
            return WinSDK.DXGI_FORMAT_BC1_UNORM
        case .bc1UnormSRGB:
            return WinSDK.DXGI_FORMAT_BC1_UNORM_SRGB
        case .bc2Typeless:
            return WinSDK.DXGI_FORMAT_BC2_TYPELESS
        case .bc2Unorm:
            return WinSDK.DXGI_FORMAT_BC2_UNORM
        case .bc2UnormSRGB:
            return WinSDK.DXGI_FORMAT_BC2_UNORM_SRGB
        case .bc3Typeless:
            return WinSDK.DXGI_FORMAT_BC3_TYPELESS
        case .bc3Unorm:
            return WinSDK.DXGI_FORMAT_BC3_UNORM
        case .bc3UnormSRGB:
            return WinSDK.DXGI_FORMAT_BC3_UNORM_SRGB
        case .bc4Typeless:
            return WinSDK.DXGI_FORMAT_BC4_TYPELESS
        case .bc4Unorm:
            return WinSDK.DXGI_FORMAT_BC4_UNORM
        case .bc4Snorm:
            return WinSDK.DXGI_FORMAT_BC4_SNORM
        case .bc5Typeless:
            return WinSDK.DXGI_FORMAT_BC5_TYPELESS
        case .bc5Unorm:
            return WinSDK.DXGI_FORMAT_BC5_UNORM
        case .bc5Snorm:
            return WinSDK.DXGI_FORMAT_BC5_SNORM
        case .b5g6r5Unorm:
            return WinSDK.DXGI_FORMAT_B5G6R5_UNORM
        case .b5g5r5a1Unorm:
            return WinSDK.DXGI_FORMAT_B5G5R5A1_UNORM
        case .b8g8r8a8Unorm:
            return WinSDK.DXGI_FORMAT_B8G8R8A8_UNORM
        case .b8g8r8x8Unorm:
            return WinSDK.DXGI_FORMAT_B8G8R8X8_UNORM
        case .r10g10b10XrBiasA2Unorm:
            return WinSDK.DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM
        case .b8g8r8a8Typeless:
            return WinSDK.DXGI_FORMAT_B8G8R8A8_TYPELESS
        case .b8g8r8a8UnormSRGB:
            return WinSDK.DXGI_FORMAT_B8G8R8A8_UNORM_SRGB
        case .b8g8r8x8Typeless:
            return WinSDK.DXGI_FORMAT_B8G8R8X8_TYPELESS
        case .b8g8r8x8UnormSRGB:
            return WinSDK.DXGI_FORMAT_B8G8R8X8_UNORM_SRGB
        case .bc6hTypeless:
            return WinSDK.DXGI_FORMAT_BC6H_TYPELESS
        case .bc6hUf16:
            return WinSDK.DXGI_FORMAT_BC6H_UF16
        case .bc6hSf16:
            return WinSDK.DXGI_FORMAT_BC6H_SF16
        case .bc7Typeless:
            return WinSDK.DXGI_FORMAT_BC7_TYPELESS
        case .bc7Unorm:
            return WinSDK.DXGI_FORMAT_BC7_UNORM
        case .bc7UnormSRGB:
            return WinSDK.DXGI_FORMAT_BC7_UNORM_SRGB
        case .ayuv:
            return WinSDK.DXGI_FORMAT_AYUV
        case .y410:
            return WinSDK.DXGI_FORMAT_Y410
        case .y416:
            return WinSDK.DXGI_FORMAT_Y416
        case .nv12:
            return WinSDK.DXGI_FORMAT_NV12
        case .p010:
            return WinSDK.DXGI_FORMAT_P010
        case .p016:
            return WinSDK.DXGI_FORMAT_P016
        case .opaque420:
            return WinSDK.DXGI_FORMAT_420_OPAQUE
        case .yuy2:
            return WinSDK.DXGI_FORMAT_YUY2
        case .y210:
            return WinSDK.DXGI_FORMAT_Y210
        case .y216:
            return WinSDK.DXGI_FORMAT_Y216
        case .nv11:
            return WinSDK.DXGI_FORMAT_NV11
        case .ai44:
            return WinSDK.DXGI_FORMAT_AI44
        case .ia44:
            return WinSDK.DXGI_FORMAT_IA44
        case .p8:
            return WinSDK.DXGI_FORMAT_P8
        case .a8p8:
            return WinSDK.DXGI_FORMAT_A8P8
        case .b4g4r4a4Unorm:
            return WinSDK.DXGI_FORMAT_B4G4R4A4_UNORM
        case .p208:
            return WinSDK.DXGI_FORMAT_P208
        case .v208:
            return WinSDK.DXGI_FORMAT_V208
        case .v408:
            return WinSDK.DXGI_FORMAT_V408
        case .forceUInt:
            return WinSDK.DXGI_FORMAT_FORCE_UINT
        case let ._unimplemented(rawValue):
            return rawValue
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Format")
public typealias DXGI_FORMAT = Format

@available(*, deprecated, renamed: "Format.unknown")
public let DXGI_FORMAT_UNKNOWN = Format.unknown

@available(*, deprecated, renamed: "Format.r32g32b32a32Typeless")
public let DXGI_FORMAT_R32G32B32A32_TYPELESS = Format.r32g32b32a32Typeless

@available(*, deprecated, renamed: "Format.r32g32b32a32Float")
public let DXGI_FORMAT_R32G32B32A32_FLOAT = Format.r32g32b32a32Float

@available(*, deprecated, renamed: "Format.r32g32b32a32UInt")
public let DXGI_FORMAT_R32G32B32A32_UINT = Format.r32g32b32a32UInt

@available(*, deprecated, renamed: "Format.r32g32b32a32Int")
public let DXGI_FORMAT_R32G32B32A32_SINT = Format.r32g32b32a32Int

@available(*, deprecated, renamed: "Format.r32g32b32Typeless")
public let DXGI_FORMAT_R32G32B32_TYPELESS = Format.r32g32b32Typeless

@available(*, deprecated, renamed: "Format.r32g32b32Float")
public let DXGI_FORMAT_R32G32B32_FLOAT = Format.r32g32b32Float

@available(*, deprecated, renamed: "Format.r32g32b32UInt")
public let DXGI_FORMAT_R32G32B32_UINT = Format.r32g32b32UInt

@available(*, deprecated, renamed: "Format.r32g32b32Int")
public let DXGI_FORMAT_R32G32B32_SINT = Format.r32g32b32Int

@available(*, deprecated, renamed: "Format.r16g16b16a16Typeless")
public let DXGI_FORMAT_R16G16B16A16_TYPELESS = Format.r16g16b16a16Typeless

@available(*, deprecated, renamed: "Format.r16g16b16a16Float")
public let DXGI_FORMAT_R16G16B16A16_FLOAT = Format.r16g16b16a16Float

@available(*, deprecated, renamed: "Format.r16g16b16a16Unorm")
public let DXGI_FORMAT_R16G16B16A16_UNORM = Format.r16g16b16a16Unorm

@available(*, deprecated, renamed: "Format.r16g16b16a16UInt")
public let DXGI_FORMAT_R16G16B16A16_UINT = Format.r16g16b16a16UInt

@available(*, deprecated, renamed: "Format.r16g16b16a16Snorm")
public let DXGI_FORMAT_R16G16B16A16_SNORM = Format.r16g16b16a16Snorm

@available(*, deprecated, renamed: "Format.r16g16b16a16Int")
public let DXGI_FORMAT_R16G16B16A16_SINT = Format.r16g16b16a16Int

@available(*, deprecated, renamed: "Format.r32g32Typeless")
public let DXGI_FORMAT_R32G32_TYPELESS = Format.r32g32Typeless

@available(*, deprecated, renamed: "Format.r32g32Float")
public let DXGI_FORMAT_R32G32_FLOAT = Format.r32g32Float

@available(*, deprecated, renamed: "Format.r32g32UInt")
public let DXGI_FORMAT_R32G32_UINT = Format.r32g32UInt

@available(*, deprecated, renamed: "Format.r32g32Int")
public let DXGI_FORMAT_R32G32_SINT = Format.r32g32Int

@available(*, deprecated, renamed: "Format.r32g8x24Typeless")
public let DXGI_FORMAT_R32G8X24_TYPELESS = Format.r32g8x24Typeless

@available(*, deprecated, renamed: "Format.d32FloatS8x24UInt")
public let DXGI_FORMAT_D32_FLOAT_S8X24_UINT = Format.d32FloatS8x24UInt

@available(*, deprecated, renamed: "Format.r32FloatX8x24Typeless")
public let DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS = Format.r32FloatX8x24Typeless

@available(*, deprecated, renamed: "Format.x32TypelessG8x24UInt")
public let DXGI_FORMAT_X32_TYPELESS_G8X24_UINT = Format.x32TypelessG8x24UInt

@available(*, deprecated, renamed: "Format.r10g10b10a2Typeless")
public let DXGI_FORMAT_R10G10B10A2_TYPELESS = Format.r10g10b10a2Typeless

@available(*, deprecated, renamed: "Format.r10g10b10a2Unorm")
public let DXGI_FORMAT_R10G10B10A2_UNORM = Format.r10g10b10a2Unorm

@available(*, deprecated, renamed: "Format.r10g10b10a2UInt")
public let DXGI_FORMAT_R10G10B10A2_UINT = Format.r10g10b10a2UInt

@available(*, deprecated, renamed: "Format.r11g11b10Float")
public let DXGI_FORMAT_R11G11B10_FLOAT = Format.r11g11b10Float

@available(*, deprecated, renamed: "Format.r8g8b8a8Typeless")
public let DXGI_FORMAT_R8G8B8A8_TYPELESS = Format.r8g8b8a8Typeless

@available(*, deprecated, renamed: "Format.r8g8b8a8Unorm")
public let DXGI_FORMAT_R8G8B8A8_UNORM = Format.r8g8b8a8Unorm

@available(*, deprecated, renamed: "Format.r8g8b8a8UnormSRGB")
public let DXGI_FORMAT_R8G8B8A8_UNORM_SRGB = Format.r8g8b8a8UnormSRGB

@available(*, deprecated, renamed: "Format.r8g8b8a8UInt")
public let DXGI_FORMAT_R8G8B8A8_UINT = Format.r8g8b8a8UInt

@available(*, deprecated, renamed: "Format.r8g8b8a8Snorm")
public let DXGI_FORMAT_R8G8B8A8_SNORM = Format.r8g8b8a8Snorm

@available(*, deprecated, renamed: "Format.r8g8b8a8Int")
public let DXGI_FORMAT_R8G8B8A8_SINT = Format.r8g8b8a8Int

@available(*, deprecated, renamed: "Format.r16g16Typeless")
public let DXGI_FORMAT_R16G16_TYPELESS = Format.r16g16Typeless

@available(*, deprecated, renamed: "Format.r16g16Float")
public let DXGI_FORMAT_R16G16_FLOAT = Format.r16g16Float

@available(*, deprecated, renamed: "Format.r16g16Unorm")
public let DXGI_FORMAT_R16G16_UNORM = Format.r16g16Unorm

@available(*, deprecated, renamed: "Format.r16g16UInt")
public let DXGI_FORMAT_R16G16_UINT = Format.r16g16UInt

@available(*, deprecated, renamed: "Format.r16g16Snorm")
public let DXGI_FORMAT_R16G16_SNORM = Format.r16g16Snorm

@available(*, deprecated, renamed: "Format.r16g16Int")
public let DXGI_FORMAT_R16G16_SINT = Format.r16g16Int

@available(*, deprecated, renamed: "Format.r32Typeless")
public let DXGI_FORMAT_R32_TYPELESS = Format.r32Typeless

@available(*, deprecated, renamed: "Format.d32Float")
public let DXGI_FORMAT_D32_FLOAT = Format.d32Float

@available(*, deprecated, renamed: "Format.r32Float")
public let DXGI_FORMAT_R32_FLOAT = Format.r32Float

@available(*, deprecated, renamed: "Format.r32UInt")
public let DXGI_FORMAT_R32_UINT = Format.r32UInt

@available(*, deprecated, renamed: "Format.r32Int")
public let DXGI_FORMAT_R32_SINT = Format.r32Int

@available(*, deprecated, renamed: "Format.r24g8Typeless")
public let DXGI_FORMAT_R24G8_TYPELESS = Format.r24g8Typeless

@available(*, deprecated, renamed: "Format.d24UnormS8UInt")
public let DXGI_FORMAT_D24_UNORM_S8_UINT = Format.d24UnormS8UInt

@available(*, deprecated, renamed: "Format.r24UnormX8Typeless")
public let DXGI_FORMAT_R24_UNORM_X8_TYPELESS = Format.r24UnormX8Typeless

@available(*, deprecated, renamed: "Format.x24TypelessG8UInt")
public let DXGI_FORMAT_X24_TYPELESS_G8_UINT = Format.x24TypelessG8UInt

@available(*, deprecated, renamed: "Format.r8g8Typeless")
public let DXGI_FORMAT_R8G8_TYPELESS = Format.r8g8Typeless

@available(*, deprecated, renamed: "Format.r8g8Unorm")
public let DXGI_FORMAT_R8G8_UNORM = Format.r8g8Unorm

@available(*, deprecated, renamed: "Format.r8g8UInt")
public let DXGI_FORMAT_R8G8_UINT = Format.r8g8UInt

@available(*, deprecated, renamed: "Format.r8g8Snorm")
public let DXGI_FORMAT_R8G8_SNORM = Format.r8g8Snorm

@available(*, deprecated, renamed: "Format.r8g8Int")
public let DXGI_FORMAT_R8G8_SINT = Format.r8g8Int

@available(*, deprecated, renamed: "Format.r16Typeless")
public let DXGI_FORMAT_R16_TYPELESS = Format.r16Typeless

@available(*, deprecated, renamed: "Format.r16Float")
public let DXGI_FORMAT_R16_FLOAT = Format.r16Float

@available(*, deprecated, renamed: "Format.d16Unorm")
public let DXGI_FORMAT_D16_UNORM = Format.d16Unorm

@available(*, deprecated, renamed: "Format.r16Unorm")
public let DXGI_FORMAT_R16_UNORM = Format.r16Unorm

@available(*, deprecated, renamed: "Format.r16UInt")
public let DXGI_FORMAT_R16_UINT = Format.r16UInt

@available(*, deprecated, renamed: "Format.r16Snorm")
public let DXGI_FORMAT_R16_SNORM = Format.r16Snorm

@available(*, deprecated, renamed: "Format.r16Int")
public let DXGI_FORMAT_R16_SINT = Format.r16Int

@available(*, deprecated, renamed: "Format.r8Typeless")
public let DXGI_FORMAT_R8_TYPELESS = Format.r8Typeless

@available(*, deprecated, renamed: "Format.r8Unorm")
public let DXGI_FORMAT_R8_UNORM = Format.r8Unorm

@available(*, deprecated, renamed: "Format.r8UInt")
public let DXGI_FORMAT_R8_UINT = Format.r8UInt

@available(*, deprecated, renamed: "Format.r8Snorm")
public let DXGI_FORMAT_R8_SNORM = Format.r8Snorm

@available(*, deprecated, renamed: "Format.r8Int")
public let DXGI_FORMAT_R8_SINT = Format.r8Int

@available(*, deprecated, renamed: "Format.a8Unorm")
public let DXGI_FORMAT_A8_UNORM = Format.a8Unorm

@available(*, deprecated, renamed: "Format.r1Unorm")
public let DXGI_FORMAT_R1_UNORM = Format.r1Unorm

@available(*, deprecated, renamed: "Format.r9g9b9e5SharedEXP")
public let DXGI_FORMAT_R9G9B9E5_SHAREDEXP = Format.r9g9b9e5SharedEXP

@available(*, deprecated, renamed: "Format.r8g8B8g8Unorm")
public let DXGI_FORMAT_R8G8_B8G8_UNORM = Format.r8g8B8g8Unorm

@available(*, deprecated, renamed: "Format.g8r8G8b8Unorm")
public let DXGI_FORMAT_G8R8_G8B8_UNORM = Format.g8r8G8b8Unorm

@available(*, deprecated, renamed: "Format.bc1Typeless")
public let DXGI_FORMAT_BC1_TYPELESS = Format.bc1Typeless

@available(*, deprecated, renamed: "Format.bc1Unorm")
public let DXGI_FORMAT_BC1_UNORM = Format.bc1Unorm

@available(*, deprecated, renamed: "Format.bc1UnormSRGB")
public let DXGI_FORMAT_BC1_UNORM_SRGB = Format.bc1UnormSRGB

@available(*, deprecated, renamed: "Format.bc2Typeless")
public let DXGI_FORMAT_BC2_TYPELESS = Format.bc2Typeless

@available(*, deprecated, renamed: "Format.bc2Unorm")
public let DXGI_FORMAT_BC2_UNORM = Format.bc2Unorm

@available(*, deprecated, renamed: "Format.bc2UnormSRGB")
public let DXGI_FORMAT_BC2_UNORM_SRGB = Format.bc2UnormSRGB

@available(*, deprecated, renamed: "Format.bc3Typeless")
public let DXGI_FORMAT_BC3_TYPELESS = Format.bc3Typeless

@available(*, deprecated, renamed: "Format.bc3Unorm")
public let DXGI_FORMAT_BC3_UNORM = Format.bc3Unorm

@available(*, deprecated, renamed: "Format.bc3UnormSRGB")
public let DXGI_FORMAT_BC3_UNORM_SRGB = Format.bc3UnormSRGB

@available(*, deprecated, renamed: "Format.bc4Typeless")
public let DXGI_FORMAT_BC4_TYPELESS = Format.bc4Typeless

@available(*, deprecated, renamed: "Format.bc4Unorm")
public let DXGI_FORMAT_BC4_UNORM = Format.bc4Unorm

@available(*, deprecated, renamed: "Format.bc4Snorm")
public let DXGI_FORMAT_BC4_SNORM = Format.bc4Snorm

@available(*, deprecated, renamed: "Format.bc5Typeless")
public let DXGI_FORMAT_BC5_TYPELESS = Format.bc5Typeless

@available(*, deprecated, renamed: "Format.bc5Unorm")
public let DXGI_FORMAT_BC5_UNORM = Format.bc5Unorm

@available(*, deprecated, renamed: "Format.bc5Snorm")
public let DXGI_FORMAT_BC5_SNORM = Format.bc5Snorm

@available(*, deprecated, renamed: "Format.b5g6r5Unorm")
public let DXGI_FORMAT_B5G6R5_UNORM = Format.b5g6r5Unorm

@available(*, deprecated, renamed: "Format.b5g5r5a1Unorm")
public let DXGI_FORMAT_B5G5R5A1_UNORM = Format.b5g5r5a1Unorm

@available(*, deprecated, renamed: "Format.b8g8r8a8Unorm")
public let DXGI_FORMAT_B8G8R8A8_UNORM = Format.b8g8r8a8Unorm

@available(*, deprecated, renamed: "Format.b8g8r8x8Unorm")
public let DXGI_FORMAT_B8G8R8X8_UNORM = Format.b8g8r8x8Unorm

@available(*, deprecated, renamed: "Format.r10g10b10XrBiasA2Unorm")
public let DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM = Format.r10g10b10XrBiasA2Unorm

@available(*, deprecated, renamed: "Format.b8g8r8a8Typeless")
public let DXGI_FORMAT_B8G8R8A8_TYPELESS = Format.b8g8r8a8Typeless

@available(*, deprecated, renamed: "Format.b8g8r8a8UnormSRGB")
public let DXGI_FORMAT_B8G8R8A8_UNORM_SRGB = Format.b8g8r8a8UnormSRGB

@available(*, deprecated, renamed: "Format.b8g8r8x8Typeless")
public let DXGI_FORMAT_B8G8R8X8_TYPELESS = Format.b8g8r8x8Typeless

@available(*, deprecated, renamed: "Format.b8g8r8x8UnormSRGB")
public let DXGI_FORMAT_B8G8R8X8_UNORM_SRGB = Format.b8g8r8x8UnormSRGB

@available(*, deprecated, renamed: "Format.bc6hTypeless")
public let DXGI_FORMAT_BC6H_TYPELESS = Format.bc6hTypeless

@available(*, deprecated, renamed: "Format.bc6hUf16")
public let DXGI_FORMAT_BC6H_UF16 = Format.bc6hUf16

@available(*, deprecated, renamed: "Format.bc6hSf16")
public let DXGI_FORMAT_BC6H_SF16 = Format.bc6hSf16

@available(*, deprecated, renamed: "Format.bc7Typeless")
public let DXGI_FORMAT_BC7_TYPELESS = Format.bc7Typeless

@available(*, deprecated, renamed: "Format.bc7Unorm")
public let DXGI_FORMAT_BC7_UNORM = Format.bc7Unorm

@available(*, deprecated, renamed: "Format.bc7UnormSRGB")
public let DXGI_FORMAT_BC7_UNORM_SRGB = Format.bc7UnormSRGB

@available(*, deprecated, renamed: "Format.ayuv")
public let DXGI_FORMAT_AYUV = Format.ayuv

@available(*, deprecated, renamed: "Format.y410")
public let DXGI_FORMAT_Y410 = Format.y410

@available(*, deprecated, renamed: "Format.y416")
public let DXGI_FORMAT_Y416 = Format.y416

@available(*, deprecated, renamed: "Format.nv12")
public let DXGI_FORMAT_NV12 = Format.nv12

@available(*, deprecated, renamed: "Format.p010")
public let DXGI_FORMAT_P010 = Format.p010

@available(*, deprecated, renamed: "Format.p016")
public let DXGI_FORMAT_P016 = Format.p016

@available(*, deprecated, renamed: "Format.opaque420")
public let DXGI_FORMAT_420_OPAQUE = Format.opaque420

@available(*, deprecated, renamed: "Format.yuy2")
public let DXGI_FORMAT_YUY2 = Format.yuy2

@available(*, deprecated, renamed: "Format.y210")
public let DXGI_FORMAT_Y210 = Format.y210

@available(*, deprecated, renamed: "Format.y216")
public let DXGI_FORMAT_Y216 = Format.y216

@available(*, deprecated, renamed: "Format.nv11")
public let DXGI_FORMAT_NV11 = Format.nv11

@available(*, deprecated, renamed: "Format.ai44")
public let DXGI_FORMAT_AI44 = Format.ai44

@available(*, deprecated, renamed: "Format.ia44")
public let DXGI_FORMAT_IA44 = Format.ia44

@available(*, deprecated, renamed: "Format.p8")
public let DXGI_FORMAT_P8 = Format.p8

@available(*, deprecated, renamed: "Format.a8p8")
public let DXGI_FORMAT_A8P8 = Format.a8p8

@available(*, deprecated, renamed: "Format.b4g4r4a4Unorm")
public let DXGI_FORMAT_B4G4R4A4_UNORM = Format.b4g4r4a4Unorm

@available(*, deprecated, renamed: "Format.p208")
public let DXGI_FORMAT_P208 = Format.p208

@available(*, deprecated, renamed: "Format.v208")
public let DXGI_FORMAT_V208 = Format.v208

@available(*, deprecated, renamed: "Format.v408")
public let DXGI_FORMAT_V408 = Format.v408

@available(*, deprecated, renamed: "Format.forceUInt")
public let DXGI_FORMAT_FORCE_UINT = Format.forceUInt

#endif