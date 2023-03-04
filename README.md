## Apex Logger with parameterized logging and argument validation

Provides a flexible and extensible Logger class with parameterized logging.

<a href="https://login.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000YyjaQAC">
<img alt="Deploy to Salesforce"
src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

This logger with parameterized logging is a logging utility that allows for the insertion of dynamic values, known as parameters, into log messages at runtime. This allows for more detailed and informative log messages, as the values of variables or the state of the system can be included in the log.

This feature is useful for debugging and troubleshooting by providing more detailed and informative log messages and also it helps developers to track their application by providing more data in the logs.

### Logger class
The "{}" pair is called the formatting anchor. It serves to designate the 
location where arguments need to be substituted within the message pattern.
Logs debug, info and error messages to the console with parameters to be merged into the given stringFormat.
```Apex
Logger logger = new LoggerImpl();

logger.debug('Test debug');
//|DEBUG|Test debug: 12

logger.error('Test error: {0} ', 12);
//|ERROR|Test error: 12

logger.debug('Test {0} debug: {0} ', 'StrValue');
//|DEBUG|Test StrValue debug: StrValue

logger.info('Test info {0} message {1}, {2} ', new List<Object>{
        'Str', 12, new List<Integer>{1, 2}
});
//|INFO|Test info Str message 12, (1, 2)

logger.debug('Test {0} debug {1} message {2}, {3} ', new List<Object>{
        Datetime.newInstance(2021, 12, 6),
        'Str', 12, new Map<Integer, String>{1 => 'one', 2 => 'two'}
});
//|DEBUG|Test 2021-12-06 00:00:00 debug Str message 12, {1=one, 2=two}
```
### Argument validation using ObjectUtil class
Early argument validation using fail fast principle is a software design pattern that emphasizes the importance of validating input arguments early in the execution process and immediately stopping execution and throwing an exception when invalid arguments are detected. This can help to prevent errors and improve the robustness and reliability of the code.

ObjectUtil class provides basic object validation methods currently **requireNonNull(Object obj, String message)** and **requireNonEmpty(List<Object> objs, String message)**.




```Apex
    public String method(List<Id> recordIds, String logId) {
    
        ObjectUtil.requireNonNull(logId,'Log Id cannot be null for ... !');
        ObjectUtil.requireNonEmpty(recordIds, 'Record Id list cannot be empty for ... !');
    
        logger.info('SObject record id(s) received for processing: {0}', recordIds);
        logger.info('SObject external Log id received : {0}', logId);
}

```
