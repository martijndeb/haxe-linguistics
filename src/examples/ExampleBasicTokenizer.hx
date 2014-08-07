package examples;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.languages.Dutch;

class ExampleBasicTokenizer
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage(Dutch);
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        trace(tokenizer.tokenize("Nederlanders drinken 's morgens gemiddeld 2 koppen koffie."));

    }
}