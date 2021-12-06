
struct PrometheusResponse<Content: Decodable>: Decodable {

    // MARK: Nested Types

    enum CodingKeys: String, CodingKey {
        case content = "data"
        case status
        case errorType
        case error
        case warnings
    }

    // MARK: Stored Properties

    let content: Content?
    let status: PrometheusResponseStatus
    let errorType: String?
    let error: String?
    let warnings: [String]?

}
