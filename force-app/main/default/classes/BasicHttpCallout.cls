public with sharing class BasicHttpCallout {
    public class BasicHttpCallout {
        public static HttpResponse makeGetCallout() {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            // If the request is successful, parse the JSON response.
            if(response.getStatusCode() == 200) {
                // Deserializes the JSON string into collections of primitive data types.
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                // Cast the values in the 'animals' key as a list
               // List<Object> args = (List<Object>) results.get('args');
                List<object> args = new List<object>();
                System.debug('Received the following data:' + results.get('args'));
                for(Object arg: args) {
                    System.debug(args);
                }
            }
            return response;
        }     
    }
}
