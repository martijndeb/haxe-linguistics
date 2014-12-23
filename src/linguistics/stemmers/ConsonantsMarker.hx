package linguistics.stemmers;

class ConsonantsMarker {

    private var vowels:Array<String> = [];

    public function new( myVowels:Array<String> ) {

        vowels = myVowels;

    }

    public function mark( myString:String ):String {

        myString = myString.toLowerCase();

        if ( myString.substr( 0, 1 ) == "y" ) {

            myString = "Y" + myString.substr( 1 );

        }

        var pos:Int = 1;
        while ( pos < myString.length ) {

            if ( vowels.indexOf( myString.substr( pos - 1, 1) ) > -1 &&
                 myString.substr( pos, 1 ) == "y" ) {

                myString = myString.substr( 0, pos ) + "Y" + myString.substr( pos + 1 );

            }

            if ( pos + 1 < myString.length &&
                 vowels.indexOf( myString.substr( pos - 1, 1) ) > -1 &&
                 vowels.indexOf( myString.substr( pos + 1, 1) ) > -1 &&
                 ( myString.substr( pos, 1 ) == "u" ||
                   myString.substr( pos, 1 ) == "i" ||
                   myString.substr( pos, 1 ) == "y"
                 )
                ) {

                var upper:String = myString.substr( pos, 1 ).toUpperCase();

                myString = myString.substr( 0, pos ) + upper + myString.substr( pos + 1 );

            }

            myString = myString.split( "qu" ).join( "qU" );

            pos++;

        }

        return myString;

    }

}