
extension Interval {

    var stringValue: String {
        switch self {
        case let .seconds(value):
            return value.description + "s"
        case let .minutes(value):
            return value.description + "m"
        case let .hours(value):
            return value.description + "h"
        case let .days(value):
            return value.description + "d"
        case let .weeks(value):
            return value.description + "w"
        case let .years(value):
            return value.description + "y"
        }
    }

}
