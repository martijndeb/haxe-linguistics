package linguistics.tokenizers.tokens;

import linguistics.tokenizers.tokens.IToken;

class Token implements IToken {

    public var documentIndex:Int;
    public var relativeIndex:Int;

    public var token:String;
    public var normalizedToken:String;

    public function new( myTokenString:String, ?myDocumentIndex:Int, ?myRelativeIndex:Int ) {

        token = myTokenString;

        documentIndex = myDocumentIndex;
        relativeIndex = myRelativeIndex;

    }

    public function isValidFor( myTokenString:String ):Bool {

        return true;

    }

    public function normalize():String {

        normalizedToken = token;
        return normalizedToken;

    }

    public function toString():String {

        return token;

    }

    public function isEqualToToken( myToken:IToken, ?doNormalize:Bool ):Bool {

        var compareTo:String = doNormalize == true ? myToken.normalize().toLowerCase() : myToken.token.toLowerCase();
        var compareFrom:String = doNormalize == true ? normalize().toLowerCase() : token.toLowerCase();

        return (compareFrom == compareTo);

    }


}