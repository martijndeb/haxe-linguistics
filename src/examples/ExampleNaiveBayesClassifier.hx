package examples;

import linguistics.classifiers.IClassifier;
import linguistics.classifiers.NaiveBayesClassifier;

class ExampleNaiveBayesClassifier
{
    static public function main():Void {

        var classifier:IClassifier = new NaiveBayesClassifier();
        classifier.addDocument( "The fool doth think he is wise, but the wise man knows himself to be a fool.", "shakespeare" );
        classifier.addDocument( "Love looks not with the eyes, but with the mind, and therefore is winged Cupid painted blind.", "shakespeare" );
        classifier.addDocument( "Be not afraid of greatness. Some are born great, some achieve greatness, and others have greatness thrust upon them.", "shakespeare" );
        classifier.addDocument( "The fault, dear Brutus, is not in our stars, but in ourselves.", "shakespeare" );
        classifier.addDocument( "The saddest aspect of life right now is that science gathers knowledge faster than society gathers wisdom.", "asimov" );
        classifier.addDocument( "Properly read, the Bible is the most potent force for atheism ever conceived.", "asimov" );
        classifier.addDocument( "If knowledge can create problems, it is not through ignorance that we can solve them.", "asimov" );
        classifier.addDocument( "Creationists make it sound as though a 'theory' is something you dreamt up after being drunk all night.", "asimov" );
        classifier.addDocument( "Books are a uniquely portable magic.", "king" );
        classifier.addDocument( "Monsters are real, and ghosts are real too. They live inside us, and sometimes, they win.", "king" );
        classifier.addDocument( "If you want to be a writer, you must do two things above all others: read a lot and write a lot.", "king" );
        classifier.addDocument( "That wasn't any act of God. That was an act of pure human fuckery.", "king" );
        classifier.addDocument( "Remember, Hope is a good thing, maybe the best of things, and no good thing ever dies.", "king" );

        classifier.train();

        trace(classifier.classify( "It is not in the stars to hold our destiny but in ourselves." ));
        trace(classifier.classify( "To surrender to ignorance and call it God has always been premature, and it remains premature today." ));
        trace(classifier.classify( "You cannot hope to sweep someone else away by the force of your writing until it has been done to you." ));
    }
}