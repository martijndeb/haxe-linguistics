package linguistics.utils;

class StringUtility extends StringTools {

    public static function isEmpty( myString:String ):Bool {

        return !(myString == null || myString.length < 1 || StringTools.trim( myString ).length < 1 );

    }

}