
import _d3d12

/// Specifies the type of a command list.
public enum CommandListType {
    ///	Specifies a command buffer that the GPU can execute. A direct command list doesn't inherit any GPU state.
    case direct
    ///	Specifies a command buffer that can be executed only directly via a direct command list. A bundle command list inherits all GPU state (except for the currently set pipeline state object and primitive topology).
    case bundle
    ///	Specifies a command buffer for computing.
    case compute
    ///	Specifies a command buffer for copying.
    case copy
    ///	Specifies a command buffer for video decoding.
    case videoDecode
    ///	Specifies a command buffer for video processing.
    case videoProcess
    ///	Specifies a command buffer for video encoding.
    case videoEncode

    internal var rawValue: _d3d12.D3D12_COMMAND_LIST_TYPE {
        switch self {
        case .direct:
            return _d3d12.D3D12_COMMAND_LIST_TYPE_DIRECT
        case .bundle:
            return _d3d12.D3D12_COMMAND_LIST_TYPE_BUNDLE
        case .compute:
            return _d3d12.D3D12_COMMAND_LIST_TYPE_COMPUTE
        case .copy:
            return _d3d12.D3D12_COMMAND_LIST_TYPE_COPY
        case .videoDecode:
            return _d3d12.D3D12_COMMAND_LIST_TYPE_VIDEO_DECODE
        case .videoProcess:
            return _d3d12.D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS
        case .videoEncode:
            return _d3d12.D3D12_COMMAND_LIST_TYPE_VIDEO_ENCODE
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "CommandListType")
public typealias D3D12_COMMAND_LIST_TYPE = CommandListType

public extension CommandListType  {
    @available(*, deprecated, renamed: "direct")
    static let D3D12_COMMAND_LIST_TYPE_DIRECT = Self.direct
    
    @available(*, deprecated, renamed: "bundle")
    static let D3D12_COMMAND_LIST_TYPE_BUNDLE = Self.bundle
    
    @available(*, deprecated, renamed: "compute")
    static let D3D12_COMMAND_LIST_TYPE_COMPUTE = Self.compute
    
    @available(*, deprecated, renamed: "copy")
    static let D3D12_COMMAND_LIST_TYPE_COPY = Self.copy
    
    @available(*, deprecated, renamed: "videoDecode")
    static let D3D12_COMMAND_LIST_TYPE_VIDEO_DECODE = Self.videoDecode
    
    @available(*, deprecated, renamed: "videoProcess")
    static let D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS = Self.videoProcess
    
    @available(*, deprecated, renamed: "videoEncode")
    static let D3D12_COMMAND_LIST_TYPE_VIDEO_ENCODE = Self.videoEncode
}
