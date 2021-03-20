/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import WinSDK.DirectX

// The explicit D3D10 and D3D12 varients in d3dcommon.h are just aliases

/// Values that indicate how the pipeline interprets vertex data that is bound to the input-assembler stage. These primitive topology values determine how the vertex data is rendered on screen.
public enum PrimitiveTopology {
    public typealias RawValue = WinSDK.D3D_PRIMITIVE_TOPOLOGY
    /// The IA stage has not been initialized with a primitive topology. The IA stage will not function properly unless a primitive topology is defined.
    case undefined
    /// Interpret the vertex data as a list of points.
    case pointList
    /// Interpret the vertex data as a list of lines.
    case lineList
    /// Interpret the vertex data as a line strip.
    case lineStrip
    /// Interpret the vertex data as a list of triangles.
    case triangleList
    /// Interpret the vertex data as a triangle strip.
    case triangleStrip
    /// Interpret the vertex data as a list of lines with adjacency data.
    case lineListAdjacent
    /// Interpret the vertex data as a line strip with adjacency data.
    case lineStripAdjacent
    /// Interpret the vertex data as a list of triangles with adjacency data.
    case triangleListAdjacent
    /// Interpret the vertex data as a triangle strip with adjacency data.
    case triangleStripAdjacent
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList1
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList2
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList3
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList4
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList5
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList6
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList7
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList8
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList9
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList10
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList11
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList12
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList13
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList14
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList15
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList16
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList17
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList18
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList19
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList20
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList21
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList22
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList23
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList24
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList25
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList26
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList27
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList28
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList29
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList30
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList31
    /// Interpret the vertex data as a patch list.
    case controlPointPatchList32
    
    public var rawValue: RawValue {
        switch self {
        case .undefined:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_UNDEFINED
        case .pointList:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_POINTLIST
        case .lineList:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_LINELIST
        case .lineStrip:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_LINESTRIP
        case .triangleList:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST
        case .triangleStrip:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP
        case .lineListAdjacent:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_LINELIST_ADJ
        case .lineStripAdjacent:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ
        case .triangleListAdjacent:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ
        case .triangleStripAdjacent:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ
        case .controlPointPatchList1:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList2:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList3:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList4:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList5:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList6:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList7:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList8:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList9:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList10:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList11:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList12:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList13:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList14:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList15:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList16:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList17:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList18:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList19:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList20:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList21:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList22:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList23:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList24:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList25:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList26:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList27:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList28:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList29:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList30:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList31:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST
        case .controlPointPatchList32:
            return WinSDK.D3D_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "PrimitiveTopology")
public typealias D3D_PRIMITIVE_TOPOLOGY  = PrimitiveTopology

@available(*, deprecated, renamed: "undefined")
public let D3D_PRIMITIVE_TOPOLOGY_UNDEFINED = PrimitiveTopology.undefined

@available(*, deprecated, renamed: "pointList")
public let D3D_PRIMITIVE_TOPOLOGY_POINTLIST = PrimitiveTopology.pointList

@available(*, deprecated, renamed: "lineList")
public let D3D_PRIMITIVE_TOPOLOGY_LINELIST = PrimitiveTopology.lineList

@available(*, deprecated, renamed: "lineStrip")
public let D3D_PRIMITIVE_TOPOLOGY_LINESTRIP = PrimitiveTopology.lineStrip

@available(*, deprecated, renamed: "triangleList")
public let D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST = PrimitiveTopology.triangleList

@available(*, deprecated, renamed: "triangleStrip")
public let D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP = PrimitiveTopology.triangleStrip

@available(*, deprecated, renamed: "lineListAdjacent")
public let D3D_PRIMITIVE_TOPOLOGY_LINELIST_ADJ = PrimitiveTopology.lineListAdjacent

@available(*, deprecated, renamed: "lineStripAdjacent")
public let D3D_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ = PrimitiveTopology.lineStripAdjacent

@available(*, deprecated, renamed: "triangleListAdjacent")
public let D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ = PrimitiveTopology.triangleListAdjacent

@available(*, deprecated, renamed: "triangleStripAdjacent")
public let D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ = PrimitiveTopology.triangleStripAdjacent

@available(*, deprecated, renamed: "controlPointPatchList1")
public let D3D_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList1

@available(*, deprecated, renamed: "controlPointPatchList2")
public let D3D_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList2

@available(*, deprecated, renamed: "controlPointPatchList3")
public let D3D_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList3

@available(*, deprecated, renamed: "controlPointPatchList4")
public let D3D_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList4

@available(*, deprecated, renamed: "controlPointPatchList5")
public let D3D_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList5

@available(*, deprecated, renamed: "controlPointPatchList6")
public let D3D_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList6

@available(*, deprecated, renamed: "controlPointPatchList7")
public let D3D_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList7

@available(*, deprecated, renamed: "controlPointPatchList8")
public let D3D_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList8

@available(*, deprecated, renamed: "controlPointPatchList9")
public let D3D_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList9

@available(*, deprecated, renamed: "controlPointPatchList10")
public let D3D_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList10

@available(*, deprecated, renamed: "controlPointPatchList11")
public let D3D_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList11

@available(*, deprecated, renamed: "controlPointPatchList12")
public let D3D_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList12

@available(*, deprecated, renamed: "controlPointPatchList13")
public let D3D_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList13

@available(*, deprecated, renamed: "controlPointPatchList14")
public let D3D_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList14

@available(*, deprecated, renamed: "controlPointPatchList15")
public let D3D_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList15

@available(*, deprecated, renamed: "controlPointPatchList16")
public let D3D_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList16

@available(*, deprecated, renamed: "controlPointPatchList17")
public let D3D_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList17

@available(*, deprecated, renamed: "controlPointPatchList18")
public let D3D_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList18

@available(*, deprecated, renamed: "controlPointPatchList19")
public let D3D_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList19

@available(*, deprecated, renamed: "controlPointPatchList20")
public let D3D_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList20

@available(*, deprecated, renamed: "controlPointPatchList21")
public let D3D_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList21

@available(*, deprecated, renamed: "controlPointPatchList22")
public let D3D_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList22

@available(*, deprecated, renamed: "controlPointPatchList23")
public let D3D_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList23

@available(*, deprecated, renamed: "controlPointPatchList24")
public let D3D_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList24

@available(*, deprecated, renamed: "controlPointPatchList25")
public let D3D_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList25

@available(*, deprecated, renamed: "controlPointPatchList26")
public let D3D_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList26

@available(*, deprecated, renamed: "controlPointPatchList27")
public let D3D_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList27

@available(*, deprecated, renamed: "controlPointPatchList28")
public let D3D_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList28

@available(*, deprecated, renamed: "controlPointPatchList29")
public let D3D_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList29

@available(*, deprecated, renamed: "controlPointPatchList30")
public let D3D_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList30

@available(*, deprecated, renamed: "controlPointPatchList31")
public let D3D_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList31

@available(*, deprecated, renamed: "controlPointPatchList32")
public let D3D_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST = PrimitiveTopology.controlPointPatchList32

#endif
