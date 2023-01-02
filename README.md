## Apex Logger with parameterized logging and argument validation

Provides a flexible and extensible Logger class with parameterized logging.

<a href="https://login.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000Yw2UQAS">
<img alt="Deploy to Salesforce"
src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

### Logger class
The "{}" pair is called the formatting anchor. It serves to designate the 
location where arguments need to be substituted within the message pattern.
```Apex
Logger logger = new Logger();

logger.debug('Test debug');
//|DEBUG|Test debug: 12

logger.error('Test error: {} ',12);
//|ERROR|Test error: 12

logger.debug('Test {} debug: {} ','StrValue');
//|DEBUG|Test StrValue debug: StrValue

logger.info('Test info {} message {}, {} ',new List<Object>{'Str',12,new List<Integer>{1,2}});
//|INFO|Test info Str message 12, (1, 2)

logger.debug('Test {} debug {} message {}, {} ',new List<Object>{Datetime.newInstance(2021,12,6),
                                                            'Str',12,new Map<Integer,String>{1=>'one',2=>'two'}});
//|DEBUG|Test 2021-12-06 00:00:00 debug Str message 12, {1=one, 2=two}
```
### Argument validation using ObjectUtil class
Provides basic object validation methods currently ***requireNonNull(Object obj, String message)*** and ***requireNonEmpty(List<Object> objs, String message)***.

```Apex
    public String method(List<Id> recordIds, String logId) {
    
        ObjectUtil.requireNonNull(logId,'Log Id cannot be null for ... !');
        ObjectUtil.requireNonEmpty(recordIds, 'Record Id list cannot be empty for ... !');
    
        logger.info('SObject record id(s) received for processing: {}', recordIds);
        logger.info('SObject external Log id received : {}', logId);
}

```