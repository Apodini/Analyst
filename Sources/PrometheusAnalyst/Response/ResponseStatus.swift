
struct PrometheusResponseStatus: RawRepresentable, Decodable {

    static let success = Self(rawValue: "success")
    static let error = Self(rawValue: "error")

    let rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }

}
