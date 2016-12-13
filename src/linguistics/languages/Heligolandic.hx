package linguistics.languages;

import linguistics.languages.LanguageBase;
import linguistics.tokenizers.ITokenizer;

class Heligolandic extends LanguageBase {

    public function new() { super(); }

    override private function setProperties():Void {

        basicTokenExpression = ~/[^a-zA-Z0-9_\-'âêîôûàèìòùëïöüŸáéíóúýÂÊÎÔÛÀÈÌÒÙËÏÖÜŸÁÉÍÓÚÝ]+/g;

        name = "Heligolandic";

        basicStemmer = linguistics.languages.helg.PorterStemmerHELG;

    }

    override public function createTokens():Void {

        var tokenizer:ITokenizer = Type.createInstance( basicTokenizer, [] );

        stopwords = tokenizer.tokenize(

            ""

         );

    }
}