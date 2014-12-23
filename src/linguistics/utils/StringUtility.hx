package linguistics.utils;

class StringUtility {

    public function new() {}

    public static function isEmpty( myString:String ):Bool {

        return !(myString == null || myString.length < 1 || StringTools.trim( myString ).length < 1 );

    }

    public static function replaceLastOccurance( myString:String, mySearchString:String, myReplaceString:String ):String {

        var index:Int  = myString.lastIndexOf( mySearchString );
        var left:String = myString.substr( 0, index );
        var right:String = myString.substr( index );
        right = StringTools.replace( right, mySearchString, myReplaceString );

        return left + right;

    }
}