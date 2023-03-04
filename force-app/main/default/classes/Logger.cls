/**
 * Logs debug, info and error messages to the console with parameters to be merged into the given stringFormat.
 * Example: logger.debug('Test {0} debug', 'paramString'); // Test paramString debug
 */
public interface Logger {
    /**
    Logs a debug level message with the given string.
    @param stringToLog The string to log.
    */
    void debug(String stringToLog);
   /**
    Logs a debug level message with the given string to format and one argument.
    The stringToFormat parameter should be in the format of 'Test {0} debug'
    where the {0} placeholder for the argument to be inserted.

    @param stringToLog The string to log with the argument.
    @param argument The argument to merge into the string.
    */
    void debug(String stringToLog, Object argument);
    /**
      Logs a debug level message with the given string to format and multiple arguments.
      The stringToFormat parameter should be in the format of 'Test {0} debug {1}'
      where the {0} and {1} are placeholders for the arguments to be inserted.

      @param stringToLog The string to log with the arguments.
      @param arguments The list of arguments to merge into the string.
    */
    void debug(String stringToLog, List<Object> arguments);
    /**
        Logs an error level message with the given string.
        @param stringToLog The string to log.
    */
    void error(String stringToLog);
    /**
       Logs an error level message with the given string to format and one argument.
       The stringToFormat parameter should be in the format of 'Test {0} debug'
       where the {0} placeholder for the argument to be inserted.

       @param stringToLog The string to log with the argument.
       @param argument The argument to merge into the string.
    */
    void error(String stringToLog, Object argument);
    /**
      Logs an error level message with the given string to format and multiple arguments.
      The stringToFormat parameter should be in the format of 'Test {0} debug {1}'
      where the {0} and {1} are placeholders for the arguments to be inserted.

      @param stringToLog The string to log with the arguments.
      @param arguments The list of arguments to merge into the string.
    */
    void error(String stringToLog, List<Object> arguments);
    /**
       Logs an info level message with the given string.
       @param stringToLog The string to log.
   */
    void info(String stringToLog);
    /**
    Logs an info level message with the given string to format and one argument.
    The stringToFormat parameter should be in the format of 'Test {0} debug'
    where the {0} placeholder for the argument to be inserted.

    @param stringToLog The string to log with the argument.
    @param argument The argument to merge into the string.

    */
    void info(String stringToLog, Object argument);
    /**
     Logs an info  level message with the given string to format and multiple arguments.
     The stringToFormat parameter should be in the format of 'Test {0} debug {1}'
     where the {0} and {1} are placeholders for the arguments to be inserted.

     @param stringToLog The string to log with the arguments.
     @param arguments The list of arguments to merge into the string.
   */
    void info(String stringToLog, List<Object> arguments);

}