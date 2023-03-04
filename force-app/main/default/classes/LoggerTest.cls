@IsTest
public with sharing class LoggerTest {

    @IsTest
    public static void testMergeArgsToStringWithStringToFormatAndEmptyArgListShouldReturnString(){
       LoggerImpl logger = new LoggerImpl();
       String stringToLog = 'Test debug message';

       String result = logger.mergeArgsToString(stringToLog,new List<Object>());

       Assert.areEqual(stringToLog, result);
    }
    @IsTest
    public static void testMergeArgsToStringWithStringToFormatAndNullListShouldReturnMessage(){
       LoggerImpl logger = new LoggerImpl();
       String stringToLog = 'Test debug message';

       String result = logger.mergeArgsToString(stringToLog,null);

       Assert.areEqual(stringToLog, result);
    }
    @IsTest
    public static void testMergeArgsToStringWithOneArgMessageAndOneObjectListShouldReturnMessage(){
       LoggerImpl logger = new LoggerImpl();
       String stringToLog =  'Test debug {0} message';
       List<Object> objectList = new List<Object>{'Str'};
       String expected = 'Test debug Str message';

       String result = logger.mergeArgsToString(stringToLog,objectList);

       Assert.areEqual(expected,result);
    }
    @IsTest
    public static void testMergeArgsToStringWithTwoArgMessageAndTwoObjectListShouldReturnMessage(){
       LoggerImpl logger = new LoggerImpl();
       String stringToLog = 'Test debug {0} message {1}';
       List<Object> objectList = new List<Object>{'Str',12};
       String expected = 'Test debug Str message 12';

       String result = logger.mergeArgsToString(stringToLog,objectList);

       System.assertEquals(expected,result);
    }
    @IsTest
    public static void testMergeArgsToStringWithThreeArgMessageAndThreeObjectListShouldReturnMessage(){
       LoggerImpl logger = new LoggerImpl();
       String stringToLog = 'Test debug {0} message {1}, {2}';
       List<Object> objectList = new List<Object>{'Str',12,new List<Integer>{1,2}};
       String expected = 'Test debug Str message 12, (1, 2)';

       String result = logger.mergeArgsToString(stringToLog,objectList);

       Assert.areEqual(expected,result);
    }
    @IsTest
    public static void testMergeArgsToStringWithThreeArgMessageAndTwoObjectListShouldReturnMessage(){
       LoggerImpl logger = new LoggerImpl();
       String stringToLog = 'Test debug {0} message {1}, {0}';
       List<Object> objectList = new List<Object>{'Str',12};
       String expected = 'Test debug Str message 12, Str';

       String result = logger.mergeArgsToString(stringToLog,objectList);

       Assert.areEqual(expected,result);
    }
    @IsTest
    public static void testMergeArgsToStringWithTwoArgMessageAndThreeObjectListShouldReturnMessage(){
       LoggerImpl logger = new LoggerImpl();
       String stringToLog = 'Test debug {0} message {1}';
       List<Object> objectList = new List<Object>{'Str',12,new List<Integer>{1,2}};
       String expected = 'Test debug Str message 12';

       String result = logger.mergeArgsToString(stringToLog,objectList);

       Assert.areEqual(expected,result);
    }
    @IsTest
    public static void testMergeArgsToStringWithFourArgMessageAndFourObjectListShouldReturnMessage(){
        LoggerImpl logger = new LoggerImpl();
        String stringToLog = '{0} Test debug {1} message {2}, {3}';
        List<Object> objectList = new List<Object>{Date.newInstance(2023,03,04),
                                        'Str',12,new List<Integer>{1,2}};
        String expected = '2023-03-04 00:00:00 Test debug Str message 12, (1, 2)';

        String result = logger.mergeArgsToString(stringToLog,objectList);

        Assert.areEqual(expected,result);
    }
    @IsTest
    public static void testDebugLogs(){
        LoggerImpl logger = new LoggerImpl();
        String stringToLog = 'Test debug {0} message {1}';
        List<Object> objectList = new List<Object>{'Str',12,new List<Integer>{1,2}};
        logger.debug(stringToLog);
        logger.debug(stringToLog,'Test');
        logger.debug(stringToLog,objectList);
    }
    @IsTest
    public static void testInfoLogs(){
        LoggerImpl logger = new LoggerImpl();
        String stringToLog = 'Test debug {0} message {1}';
        List<Object> objectList = new List<Object>{'Str',12,new List<Integer>{1,2}};
        logger.info(stringToLog);
        logger.info(stringToLog,'Test');
        logger.info(stringToLog,objectList);
    }
    @IsTest
    public static void testErrorLogs(){
        LoggerImpl logger = new LoggerImpl();
        String stringToLog = 'Test debug {0} message {1}';
        List<Object> objectList = new List<Object>{'Str',12,new List<Integer>{1,2}};
        logger.error(stringToLog);
        logger.error(stringToLog,'Test');
        logger.error(stringToLog,objectList);
    }
}