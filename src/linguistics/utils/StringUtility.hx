package linguistics.utils;

class StringUtility {

    public function new() {}

    public static function isEmpty( myString:String ):Bool {

        return !(myString == null || myString.length < 1 || StringTools.trim( myString ).length < 1 );

    }

}