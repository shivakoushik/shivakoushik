@isTest
public class RestApiWrapperTest {
    
    @isTest
    static void testCallApiSuccess() {
        RestApiWrapper api = new RestApiWrapper();
        String endpoint = 'https://example.com/api/v1/users';
        String method = 'POST';
        String body = '';
        Map<String, String> headers = new Map<String, String>{
            'Authorization' => 'Bearer abc123',
            'Content-Type' => 'application/json'
        };
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Integer statusCode = api.callApi(endpoint, method, body, headers);
        Map<String, Object> jsonMap = api.jsonMap;
        System.assertEquals(200, statusCode);
        System.assertEquals('Shiva', jsonMap.get('firstName'));
        System.assertEquals('Rachapudi', jsonMap.get('lastName'));
        System.assertEquals(30, jsonMap.get('age'));
    }
    @isTest
    static void testCallApiSuccess2() {
        RestApiWrapper api = new RestApiWrapper();
        String endpoint = 'https://example.com/api/v1/users';
        String method = 'GET';
        String body = '';
        Map<String, String> headers = new Map<String, String>{
            'Authorization' => 'Bearer abc123',
            'Content-Type' => 'application/json'
        };
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Integer statusCode = api.callApi(endpoint, method, body, headers);
        Map<String, Object> jsonMap = api.jsonMap;
        System.assertEquals(200, statusCode);
    }
    
    @isTest
    static void testCallApiError() {
        RestApiWrapper api = new RestApiWrapper();
        String endpoint = 'https://example.com/api/v1/users/123';
        String method = 'DELETE';
        String body = '';
        Map<String, String> headers = new Map<String, String>{
            'Authorization' => 'Bearer abc123',
            'Content-Type' => 'application/json'
        };
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Integer statusCode = api.callApi(endpoint, method, body, headers);
        Map<String, Object> jsonMap = api.jsonMap;
        System.assertNotEquals(200, statusCode);
        System.assertEquals('User not found', jsonMap.get('message'));
        System.assertEquals(404, jsonMap.get('status'));
    }
    
    // Mock HttpCalloutMock class to generate mock HTTP responses
    public class MockHttpResponseGenerator implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest request) {
            HTTPResponse response = new HTTPResponse();
            String responseBody;
            if (request.getMethod() == 'POST' && request.getEndpoint() == 'https://example.com/api/v1/users') {
                responseBody = '{"firstName": "Shiva", "lastName": "Rachapudi", "age": 30}';
                response.setStatusCode(200);
            } else if (request.getMethod() == 'DELETE' && request.getEndpoint() == 'https://example.com/api/v1/users/123') {
                responseBody = '{"status": 404, "message": "User not found"}';
                response.setStatusCode(404);
            } 
            else if (request.getMethod() == 'GET' && request.getEndpoint() == 'https://example.com/api/v1/users') {
                responseBody = '[{"12345":15000}]';
                response.setStatusCode(200);
            } else {
                responseBody = '';
                response.setStatusCode(500);
            }
            response.setBody(responseBody);
            return response;
        }
    }
}