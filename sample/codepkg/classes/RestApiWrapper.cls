public class RestApiWrapper {
    public Map<String, Object> jsonMap = new Map<string,Object>();
    public String ErrorMessage;
    public String responseStatus;
    public Integer callApi(String endpoint, String method, String body, Map<String, String> headers) {
        HttpRequest request = new HttpRequest();
        HTTPResponse response;
        request.setEndpoint(endpoint);
        request.setMethod(method);
        request.setBody(body);
        request.setTimeout(120000);
        System.debug('Request body: ' + body);
        if (headers != null && !headers.isEmpty()) {
            for (String key : headers.keySet()) {
                request.setHeader(key, headers.get(key));
            }
        }
        try {
            Http http = new Http();
            response = http.send(request);
            System.debug('Response : ' + response);
            String responseBody;
            if (response.getStatusCode() == 200 || response.getStatusCode() == 202) {
                // Deserialize the response body to a JSON object
                responseBody = response.getBody();
                system.debug('responseBody in API Wrapper:'+responseBody);
                if (!string.isEmpty(responseBody)) {
                    try{
                        jsonMap = (Map<String, Object>)JSON.deserializeUntyped(responseBody);
                        
                    }
                    catch(exception JSONEx){
                        system.debug('JSON Exception in API Wrapper:'+JSONEx);
                        try {
                            List<Object> jsonList = (List<Object>)JSON.deserializeUntyped(responseBody);
                            for(object obj : jsonList){
                                Map<String,Object> innerMap = (Map<String,Object>)obj;
                                for(String key : innerMap.keySet()){
                                    jsonMap.put(key,innerMap.get(key));
                                }
                            }
                        }
                        catch(exception JSONEx2){
                           system.debug('JSON Exception 2 in API Wrapper:'+JSONEx2); 
                        }    
                    } 
                }
            }
            else if(response.getStatusCode() != 200 &&
                    response.getStatusCode() != 202){
                        ErrorMessage = response.getBody(); 
                        try{
                            jsonMap = (Map<String, Object>)JSON.deserializeUntyped(ErrorMessage);
                            system.debug('-->RestAPIWrapper-errorJson:'+jsonMap);
                        }
                        catch(exception JSONEx){
                            system.debug('-->RestAPIWrapper-errorMsg:'+ErrorMessage);
                        }
            }
            System.debug('Response body: ' + response.getBody());
            responseStatus = response.getStatus();
        } catch (Exception e) {
            System.debug('Response : ' + response);
            System.debug('Error: ' + e.getMessage());
            ErrorMessage = e.getMessage();
            return 999;
        }
        if (response != null) {
            return response.getStatusCode();
        } 
        else {
            return 999;
        }       
    }
}