
public struct TimeRange {

    public let duration: Interval
    public let step: Interval
    public let offset: Interval?

    public static func range(_ duration: Interval, step: Interval, offset: Interval? = nil) -> TimeRange {
        .init(duration: duration, step: step, offset: offset)
    }

}
