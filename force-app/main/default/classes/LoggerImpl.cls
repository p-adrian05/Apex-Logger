/**
    Implements the Logger interface to provide a simple way to log parameterized messages at different levels.
 */
public with sharing virtual class LoggerImpl implements Logger{

    private final System.LoggingLevel DEBUG_LEVEL = LoggingLevel.DEBUG;
    private final System.LoggingLevel ERROR_LEVEL = LoggingLevel.ERROR;
    private final System.LoggingLevel INFO_LEVEL = LoggingLevel.INFO;

    public void debug(String stringToLog){
        logString(stringToLog, null, DEBUG_LEVEL);
    }
    public void debug(String stringToLog, Object argument){
        logString(stringToLog, new List<Object>{argument}, DEBUG_LEVEL);
    }
    public void debug(String stringToLog, List<Object> arguments){
        logString(stringToLog, arguments, DEBUG_LEVEL);
    }
    public void error(String stringToLog){
        logString(stringToLog, null, ERROR_LEVEL);
    }
    public void error(String stringToLog, Object argument){
        logString(stringToLog, new List<Object>{argument}, ERROR_LEVEL);
    }
    public void error(String stringToLog, List<Object> arguments){
        logString(stringToLog, arguments, ERROR_LEVEL);
    }
    public void info(String stringToLog){
        logString(stringToLog, null, INFO_LEVEL);
    }
    public void info(String stringToLog, Object argument){
        logString(stringToLog, new List<Object>{argument}, INFO_LEVEL);
    }
    public void info(String stringToLog, List<Object> arguments){
        logString(stringToLog, arguments, INFO_LEVEL);
    }
    /**
        Logs a message with the given string to format and optional argument(s) at the specified logging level.
        The stringToFormat parameter should be in the format of "Test {0} debug {1}" where the {0} and {1}
        are placeholders for the arguments to be inserted.

        @param stringToLog The string to log with the arguments.
        @param arguments The list of arguments to merge into the string. Can be null or empty.
        @param level The logging level to use for the message.
    */
    private void logString(String stringToLog, List<Object> arguments,System.LoggingLevel level){
       System.debug(level,mergeArgsToString(stringToLog, arguments));
    }
    /**
        Merges a list of arguments into a given string format and returns the formatted string.
        The stringToFormat parameter should be in the format of "Test {0} debug {1}" where the {0} and {1}
        are placeholders for the arguments to be inserted.
        If the string or the list of arguments are null or empty, returns the original string.

        @param stringToFormat The string to format with the arguments.
        @param arguments The list of arguments to merge into the string.
        @return A formatted string with the given arguments,
                or the original string if either the string or arguments are null or empty.
    */
    @TestVisible
    private String mergeArgsToString(String stringToFormat, List<Object> arguments){
        if(stringToFormat == null || arguments == null || arguments.isEmpty()){
            return stringToFormat;
        }else{
            return String.format(stringToFormat,arguments);
        }
    }
}