
public struct InclusiveMatchingRule: MatchingRule {

    public let labels: [String]

    public init(labels: [String]) {
        self.labels = labels
    }

}

extension MatchingRule where Self == InclusiveMatchingRule {

    public static func ignoring(_ labels: String...) -> InclusiveMatchingRule {
        .init(labels: labels)
    }

    public static func ignoring(_ labels: [String]) -> InclusiveMatchingRule {
        .init(labels: labels)
    }

}
