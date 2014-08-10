package applications;

import linguistics.Linguistics;
import linguistics.languages.ILanguage;
import linguistics.languages.Dutch;
import linguistics.languages.English;
import linguistics.languages.German;
import linguistics.languages.Frisian;
import linguistics.dictionaries.Dictionary;

class ExtractStopwords
{
    public function new()
    {
        var args:Array<String> = Sys.args();

        if ( args.length == 2 ) {

            switch ( args[0] ) {

                case "nl":
                    Linguistics.getInstance().setLanguage( Dutch );

                case "en":
                    Linguistics.getInstance().setLanguage( English );

                case "de":
                    Linguistics.getInstance().setLanguage( German );

                case "fry":
                    Linguistics.getInstance().setLanguage( Frisian );

                default:
                    Sys.println( " Usage: neko ExtractStopwords.n <nl|en|de|fry> <corpus.txt> " );
                    Sys.exit( 1 );
            }

            var fileContents:String = sys.io.File.getContent( args[1] );
            var dict:Dictionary = new Dictionary( );
            dict.addDocument( fileContents );

            var list:haxe.ds.StringMap<Int> = dict.getDictionary();

            for ( word in list.keys() ) {

                Sys.println( word + "," + list.get( word ) );

            }

        } else {

            Sys.println( " Usage: neko ExtractStopwords.n <nl|en|de|fry> <corpus.txt> " );
            Sys.exit( 1 );

        }

        Sys.exit( 0 );
    }

    static public function main()
    {
        var app = new ExtractStopwords();
    }
}