
import Foundation

public struct Tag: Equatable {

    // MARK: Stored Properties

    public let key: Tag.Key
    public let value: Tag.Value

    // MARK: Initialization

    public init(key: Tag.Key, value: Tag.Value) {
        self.key = key
        self.value = value
    }

}

// MARK: - Nested Types

extension Tag {

    public typealias Key = String

    public enum Value: Equatable {
        case string(String)
        case double(Double)
        case boolean(Bool)
        case integer(Int)
        case data(Data)
    }

}

// MARK: - CustomStringConvertible

extension Tag: CustomStringConvertible {

    public var description: String {
        "Tag(key: \(key), value: \(value))"
    }

}

extension Tag.Value: CustomStringConvertible {

    public var description: String {
        switch self {
        case let .string(value):
            return ".string(\(value))"
        case let .double(value):
            return ".double(\(value))"
        case let .boolean(value):
            return ".boolean(\(value))"
        case let .integer(value):
            return ".integer(\(value))"
        case let .data(value):
            return ".data(\(value))"
        }
    }

}
