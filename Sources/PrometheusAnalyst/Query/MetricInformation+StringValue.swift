
extension MetricInformation {

    var stringValue: String {
        guard !dimensions.isEmpty else { return label }
        let values = dimensions.map { "\($0)=\"\($1)\"" }.joined(separator: ",")
        return label + "{" + values + "}"
    }

}
