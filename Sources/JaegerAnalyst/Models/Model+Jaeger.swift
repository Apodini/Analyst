
extension Tag.Value {

    var stringValue: String {
        switch self {
        case let .string(value):
            return value
        case let .double(value):
            return value.description
        case let .boolean(value):
            return value.description
        case let .integer(value):
            return value.description
        case let .data(value):
            return String(data: value, encoding: .utf8)!
        }
    }

}
