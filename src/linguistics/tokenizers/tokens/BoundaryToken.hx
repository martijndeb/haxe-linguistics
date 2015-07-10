package linguistics.tokenizers.tokens;

import linguistics.tokenizers.tokens.IToken;
import linguistics.tokenizers.tokens.Token;

class BoundaryToken extends Token implements IToken {

    public var childTokens:Array<IToken>;

    public function new( myTokenString:String, ?myDocumentIndex:Int, ?myRelativeIndex:Int ) {

        super( myTokenString, myDocumentIndex, myRelativeIndex );

        childTokens = Linguistics.getInstance().getBasicTokenizer().tokenize( myTokenString );

    }

}