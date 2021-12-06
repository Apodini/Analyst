
import Foundation

public enum PrometheusProviderError: Error {
    case failure(URLResponse, Data)
    case couldNotEncodeQuery(String)
    case unsuccessfulResponse(Data)
    case missingResponseContent(Data)
    case wrongResponseType(Data)
    case unsupportedQueryType
    case notAvailable
}
