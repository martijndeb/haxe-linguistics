package examples;

import linguistics.*;
import linguistics.tokenizers.*;
import linguistics.languages.*;

class Playground
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage(Dutch);
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        trace(tokenizer.tokenize("Nederlanders drinken 's morgens gemiddeld 2 koppen koffie."));

    }
}