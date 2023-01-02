@isTest
public with sharing class LoggerTest {

    private static final String messageW1 = 'Test'; 
    private static final String messageW2 = 'debug'; 
    private static final String messageW3 = 'message'; 
    private static final String objMark = '{}';

    //Test debug
    private static final String messageW1W2 =  messageW1+ ' '+ messageW2;
    //Test debug message
    private static final String message = messageW1W2 +' '+ messageW3;
    //Test debug {} message
    private static final String messageWithOneArg =  messageW1W2 +' '+objMark+ ' '+messageW3;
    //Test debug {} message {}
    private static final String messageWithTwoArgs = messageWithOneArg+ ' '+ objMark;
    //Test debug {} message {}, {}
    private static final String messageWithThreeArgs = messageWithTwoArgs+ ', '+ objMark;
    //{} Test  debug {} message {}, {}
    private static final String messageWithFourArgs =  objMark + ' ' + messageWithThreeArgs;

    private static final List<Object> objectList1 = new List<Object>{'Str'};
    private static final List<Object> objectList2 = new List<Object>{'Str',12};
    private static final List<Object> objectList3 = new List<Object>{'Str',12,new List<Integer>{1,2}};
    private static final List<Object> objectList4 = new List<Object>{Datetime.newInstance(2021,12,6),'Str',12,new List<Integer>{1,2}};

    //Test debug Str message
    private static final String mergedMessageOneArg = messageW1W2+ ' '+objectList1.get(0)+' '+messageW3;
    //Test debug Str message 12
    private static final String mergedMessageTwoArgs = mergedMessageOneArg+' '+objectList2.get(1);
   //Test debug Str message 12, (1, 2)
    private static final String mergedMessageThreeArgs = mergedMessageTwoArgs+', '+objectList3.get(2);
    //2021-12-05 23:00:00 Test debug Str message 12, (1, 2)
    private static final String mergedMessageFourArgs = objectList4.get(0) + ' ' + mergedMessageThreeArgs;

    //Test debug Str message 12, Str
    private static final String mergedMessageThreeArgsWithTwoObjs = mergedMessageTwoArgs+', '+objectList2.get(0);

    @IsTest
    public static void testMergeObjectsToStringWithMessageAndEmptyObjListShouldReturnMessage(){
       Logger logger = new Logger();

       String result =  logger.mergeObjectsToString(message,new List<Object>());

       System.assertEquals(message, result);
    }
    @IsTest
    public static void testMergeObjectsToStringWithMessageAndNullListShouldReturnMessage(){
       Logger logger = new Logger();

       String result =  logger.mergeObjectsToString(message,null);

       System.assertEquals(message, result);
    }
    @IsTest
    public static void testMergeObjectsToStringWithOneArgMessageAndOneObjectListShouldReturnMessage(){
       Logger logger = new Logger();

       String result = logger.mergeObjectsToString(messageWithOneArg,objectList1);

       System.assertEquals(mergedMessageOneArg,result);
    }
    @IsTest
    public static void testMergeObjectsToStringWithTwoArgMessageAndTwoObjectListShouldReturnMessage(){
       Logger logger = new Logger();

       String result = logger.mergeObjectsToString(messageWithTwoArgs,objectList2);

       System.assertEquals(mergedMessageTwoArgs,result);
    }
    @IsTest
    public static void testMergeObjectsToStringWithThreeArgMessageAndThreeObjectListShouldReturnMessage(){
       Logger logger = new Logger();

       String result = logger.mergeObjectsToString(messageWithThreeArgs,objectList3);

       System.assertEquals(mergedMessageThreeArgs,result);
    }
    @IsTest
    public static void testMergeObjectsToStringWithThreeArgMessageAndTwoObjectListShouldReturnMessage(){
       Logger logger = new Logger();

       String result = logger.mergeObjectsToString(messageWithThreeArgs,objectList2);

       System.assertEquals(mergedMessageThreeArgsWithTwoObjs,result);
    }
    @IsTest
    public static void testMergeObjectsToStringWithTwoArgMessageAndThreeObjectListShouldReturnMessage(){
       Logger logger = new Logger();
       String result = logger.mergeObjectsToString(messageWithTwoArgs,objectList3);
        System.debug(result);
        System.debug(mergedMessageTwoArgs);

       System.assertEquals(mergedMessageTwoArgs,result);
    }
    @IsTest
    public static void testMergeObjectsToStringWithFourArgMessageAndFourObjectListShouldReturnMessage(){
        Logger logger = new Logger();

        String result = logger.mergeObjectsToString(messageWithFourArgs,objectList4);

        System.assertEquals(mergedMessageFourArgs,result);
    }
    @IsTest
    public static void testDebugLogs(){
        Logger logger = new Logger();
        logger.debug(message);
        logger.debug(message,'Test');
        logger.debug(message,objectList1);
    }
    @IsTest
    public static void testInfoLogs(){
        Logger logger = new Logger();
        logger.info(message);
        logger.info(message,'Test');
        logger.info(message,objectList1);
    }
    @IsTest
    public static void testErrorLogs(){
        Logger logger = new Logger();
        logger.error(message);
        logger.error(message,'Test');
        logger.error(message,objectList1);
    }
}