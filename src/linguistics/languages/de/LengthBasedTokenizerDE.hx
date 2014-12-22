package linguistics.languages.de;

import linguistics.tokenizers.LengthBasedTokenizer;

class LengthBasedTokenizerDE extends LengthBasedTokenizer {

    public function new( ?length:Int ) {

        super( length );

        tokenExpression = German.basicTokenExpression;

    }

}