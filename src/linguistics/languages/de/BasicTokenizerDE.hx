package linguistics.languages.de;

import linguistics.tokenizers.BasicTokenizer;

class BasicTokenizerDE extends BasicTokenizer {

    public function new() {

        tokenExpression = ~/[^a-zA-Z0-9_\-äöüÄÖÜß]+/g;

    }

}