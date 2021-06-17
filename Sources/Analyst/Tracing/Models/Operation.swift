
public struct Operation {

    // MARK: Stored Properties

    public let name: String
    public let kind: String

    // MARK: Initialization

    public init(name: String, kind: String) {
        self.name = name
        self.kind = kind
    }

}

// MARK: - CustomStringConvertible

extension Operation: CustomStringConvertible {

    public var description: String {
        "Operation(name: \"\(name)\", kind: \"\(kind)\")"
    }

}
