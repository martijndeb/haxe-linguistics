package linguistics.languages.nl;

import linguistics.tokenizers.LengthBasedTokenizer;

class LengthBasedTokenizerNL extends LengthBasedTokenizer {

    public function new( ?length:Int ) {

        super( length );

        tokenExpression = ~/[^a-zA-Z0-9_\-'âêîôûàèìòùëïöüŸáéíóúýÂÊÎÔÛÀÈÌÒÙËÏÖÜŸÁÉÍÓÚÝ]+/g;

    }

}