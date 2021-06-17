
extension RangeQuery.Kind {

    var stringValue: String {
        switch self {
        case let .matrix(scalar, time):
            return "("
                + scalar.stringValue
                + ")"
                + "["
                + time.duration.stringValue
                + ":"
                + time.step.stringValue
                + "]"
                + (time.offset.map { " offset " + $0.stringValue } ?? "")
        case let .range(vector, interval):
            return vector.stringValue + "[" + interval.stringValue + "]"
        case let .offset(range, offset):
            return range.stringValue + " offset " + offset.stringValue
        }
    }

}
