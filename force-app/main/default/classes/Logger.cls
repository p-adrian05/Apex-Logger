public with sharing virtual class Logger {

    private final System.LoggingLevel DEBUG_LEVEL = LoggingLevel.DEBUG;
    private final System.LoggingLevel ERROR_LEVEL = LoggingLevel.ERROR;
    private final System.LoggingLevel INFO_LEVEL = LoggingLevel.INFO;

    public void debug(String message){
        logMessage(message, null, DEBUG_LEVEL);
    }
    public void debug(String message, Object obj){
        logMessage(message, new List<Object>{obj}, DEBUG_LEVEL);
    }
    public void debug(String message, List<Object> objects){
        logMessage(message, objects, DEBUG_LEVEL);
    }
    public void error(String message){
        logMessage(message, null, ERROR_LEVEL);
    }
    public void error(String message, Object obj){
        logMessage(message, new List<Object>{obj}, ERROR_LEVEL);
    }
    public void error(String message, List<Object> objects){
        logMessage(message, objects, ERROR_LEVEL);
    }
    public void info(String message){
        logMessage(message, null, INFO_LEVEL);
    }
    public void info(String message, Object obj){
        logMessage(message, new List<Object>{obj}, INFO_LEVEL);
    }
    public void info(String message, List<Object> objects){
        logMessage(message, objects, INFO_LEVEL);
    }
    protected virtual void logMessage(String message, List<Object> objects,System.LoggingLevel level){
        System.debug(level,mergeObjectsToString(message, objects));
    }
    @TestVisible
    protected String mergeObjectsToString(String message, List<Object> objects){
        if(objects == null || objects.size() == 0){
            return message;
        }
        Boolean messageEndsWithAnchor = false;
        if(message.endsWith('{}')){
            message+= ' ';
            messageEndsWithAnchor = true;
        }

        List<String> messageList = message.split('\\{}');
        String result = '';
        Integer objectIndex = 0;

        for(Integer i=0, j=messageList.size(); i < j; i++){
            if(!(messageEndsWithAnchor && i == messageList.size()-1)){
                result += messageList.get(i);
            }

            if(i != messageList.size()-1){
                result+= objects.get(objectIndex);
            }

            if(objectIndex == objects.size()-1){
                objectIndex = 0;
            }else{
                objectIndex++;
            }
        }
        return result;
    }
}