@IsTest
public with sharing class ObjectUtilTest {

    @IsTest
    public static void testRequireNonNullObjectWithObjectShouldReturnObject(){
        Object obj = new List<String>{};
        Object resultObj = ObjectUtil.requireNonNull(obj,'Message');

        System.assert(obj == resultObj);
    }
    @IsTest
    public static void testRequireNonNullObjectWithNullShouldThrowException(){
        Object obj = null;
        Exception expectedException;
        try {
            ObjectUtil.requireNonNull(obj, 'Message');
        }catch (Exception e) {
            expectedException = e;
        }
        System.assert(expectedException != null);
    }
    @IsTest
    public static void testRequireNonNullStringWithStringShouldReturnString(){
        String test = 'test';
        String resultTest = ObjectUtil.requireNonNull(test,'Message');

        System.assert(test.equals(resultTest));
    }
    @IsTest
    public static void testRequireNonNullStringWithNullShouldThrowException(){
        String test = null;
        Exception expectedException;
        try {
            ObjectUtil.requireNonNull(test, 'Message');
        }catch (Exception e) {
            expectedException = e;
        }
        System.assert(expectedException != null);
    }
    @IsTest
    public static void testRequireNonEmptyListWithStringShouldReturnString(){
        List<String> listObj = new List<String>{'test'};
        List<Object> resultListObj = ObjectUtil.requireNonEmpty(listObj,'Message');

        System.assert(listObj == resultListObj);
    }
    @IsTest
    public static void testRequireNonEmptyListWithEmptyListShouldThrowException(){
        List<String> listObj = new List<String>{};
        Exception expectedException;
        try {
            ObjectUtil.requireNonEmpty(listObj, 'Message');
        }catch (Exception e) {
            expectedException = e;
        }
        System.assert(expectedException != null);
    }
    @IsTest
    public static void testRequireNonEmptyListWithNullShouldThrowException(){
        List<String> listObj = null;
        Exception expectedException;
        try {
            ObjectUtil.requireNonEmpty(listObj, 'Message');
        }catch (Exception e) {
            expectedException = e;
        }
        System.assert(expectedException != null);
    }

}