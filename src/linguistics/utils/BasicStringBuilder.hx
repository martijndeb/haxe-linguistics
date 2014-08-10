package linguistics.utils;

import linguistics.tokenizers.tokens.IToken;

class BasicStringBuilder {

    public function new() {}

    public function build( myTokenSet:Array<IToken>, ?doNormalize:Bool ):String {

        var theString:String = "";

        for ( token in myTokenSet ) {

            var tokenString:String = doNormalize == true ? token.normalize() : token.token;
            theString += tokenString + " ";

        }

        return StringTools.trim( theString );

    }

}