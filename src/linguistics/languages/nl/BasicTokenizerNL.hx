package linguistics.languages.nl;

import linguistics.tokenizers.BasicTokenizer;

class BasicTokenizerNL extends BasicTokenizer {

    public function new() {

        tokenExpression = ~/[^a-zA-Z0-9_\-'âêîôûàèìòùëïöüŸáéíóúýÂÊÎÔÛÀÈÌÒÙËÏÖÜŸÁÉÍÓÚÝ]+/g;

    }

}
