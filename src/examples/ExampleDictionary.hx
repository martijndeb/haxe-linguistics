package examples;

import linguistics.dictionaries.*;

class ExampleDictionary
{
    static public function main():Void {

        var dict:Dictionary = new Dictionary();
        dict.addDocument("To be, or not to be: that is the question.");
        dict.addDocument("What a piece of work is man! how noble in reason! how infinite in faculty! in form and moving how express and admirable! in action how like an angel! in apprehension how like a god! the beauty of the world, the paragon of animals!");
        dict.addDocument("Suspicion always haunts the guilty mind; The thief doth fear each bush an officer.");

        trace( dict.getDictionaryWords() );
        trace( dict.getDictionary() );
        trace( "Dictionary entries: " + dict.getWordCount() );
        trace( "Total words: " + dict.getTotalWordCount() );

    }
}