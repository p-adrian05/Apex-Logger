public with sharing virtual class LoggerImpl {

    private final System.LoggingLevel DEBUG_LEVEL = LoggingLevel.DEBUG;
    private final System.LoggingLevel ERROR_LEVEL = LoggingLevel.ERROR;
    private final System.LoggingLevel INFO_LEVEL = LoggingLevel.INFO;

    public void debug(String stringToFormat){
        logString(stringToFormat, null, DEBUG_LEVEL);
    }
    public void debug(String stringToFormat, Object argument){
        logString(stringToFormat, new List<Object>{argument}, DEBUG_LEVEL);
    }
    public void debug(String stringToFormat, List<Object> arguments){
        logString(stringToFormat, arguments, DEBUG_LEVEL);
    }
    public void error(String stringToFormat){
        logString(stringToFormat, null, ERROR_LEVEL);
    }
    public void error(String stringToFormat, Object argument){
        logString(stringToFormat, new List<Object>{argument}, ERROR_LEVEL);
    }
    public void error(String stringToFormat, List<Object> arguments){
        logString(stringToFormat, arguments, ERROR_LEVEL);
    }
    public void info(String stringToFormat){
        logString(stringToFormat, null, INFO_LEVEL);
    }
    public void info(String stringToFormat, Object argument){
        logString(stringToFormat, new List<Object>{argument}, INFO_LEVEL);
    }
    public void info(String stringToFormat, List<Object> arguments){
        logString(stringToFormat, arguments, INFO_LEVEL);
    }
    protected virtual void logString(String stringToFormat, List<Object> arguments,System.LoggingLevel level){
       System.debug(level,mergeArgsToString(stringToFormat, arguments));
    }
    @TestVisible
    protected String mergeArgsToString(String stringToFormat, List<Object> arguments){
        if(stringToFormat == null || arguments == null || arguments.isEmpty()){
            return stringToFormat;
        }else{
            return String.format(stringToFormat,arguments);
        }
    }
}