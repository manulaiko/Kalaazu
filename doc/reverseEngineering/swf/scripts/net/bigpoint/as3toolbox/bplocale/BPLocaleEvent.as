package net.bigpoint.as3toolbox.bplocale
{
   import flash.events.Event;
   
   public class BPLocaleEvent extends Event
   {
      
      public static const const_796:String = "BPLocaleEvent.onLanguageLoaded";
      
      public static const const_676:String = "BPLocaleEvent.onLanguageLoadingError";
      
      public static const const_3138:String = "BPLocaleEvent.onNoLanguagesLeftToLoad";
      
      public static const const_1717:String = "BPLocaleEvent.onLanguageAlreadyInQueue";
      
      public static const const_2940:String = "BPLocaleEvent.onKeyOverwritten";
      
      public static const const_2259:String = "BPLocaleEvent.onKeyNotFound";
      
      public static const const_778:String = "BPLocaleEvent.onCategoryNotFound";
       
      
      private var _text:String;
      
      private var _key:String;
      
      public function BPLocaleEvent(param1:String, param2:String = "", param3:String = "", param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._text = param2;
         this._key = param3;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function set key(param1:String) : void
      {
         this._key = param1;
      }
   }
}
