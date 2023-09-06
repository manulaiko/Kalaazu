package mx.core
{
   import flash.events.Event;
   
   public class RSLListLoader
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var currentIndex:int = 0;
      
      private var rslList:Array;
      
      private var chainedProgressHandler:Function;
      
      private var chainedCompleteHandler:Function;
      
      private var chainedIOErrorHandler:Function;
      
      private var chainedSecurityErrorHandler:Function;
      
      private var chainedRSLErrorHandler:Function;
      
      public function RSLListLoader(param1:Array)
      {
         this.rslList = [];
         super();
         this.rslList = param1;
      }
      
      public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
      {
         this.chainedProgressHandler = param1;
         this.chainedCompleteHandler = param2;
         this.chainedIOErrorHandler = param3;
         this.chainedSecurityErrorHandler = param4;
         this.chainedRSLErrorHandler = param5;
         this.currentIndex = -1;
         this.loadNext();
      }
      
      private function loadNext() : void
      {
         if(!this.isDone())
         {
            ++this.currentIndex;
            if(this.currentIndex < this.rslList.length)
            {
               this.rslList[this.currentIndex].load(this.chainedProgressHandler,this.listCompleteHandler,this.listIOErrorHandler,this.listSecurityErrorHandler,this.chainedRSLErrorHandler);
            }
         }
      }
      
      public function getItem(param1:int) : RSLItem
      {
         if(param1 < 0 || param1 >= this.rslList.length)
         {
            return null;
         }
         return this.rslList[param1];
      }
      
      public function getIndex() : int
      {
         return this.currentIndex;
      }
      
      public function getItemCount() : int
      {
         return this.rslList.length;
      }
      
      public function isDone() : Boolean
      {
         return this.currentIndex >= this.rslList.length;
      }
      
      private function listCompleteHandler(param1:Event) : void
      {
         if(this.chainedCompleteHandler != null)
         {
            this.chainedCompleteHandler(param1);
         }
         this.loadNext();
      }
      
      private function listIOErrorHandler(param1:Event) : void
      {
         if(this.chainedIOErrorHandler != null)
         {
            this.chainedIOErrorHandler(param1);
         }
      }
      
      private function listSecurityErrorHandler(param1:Event) : void
      {
         if(this.chainedSecurityErrorHandler != null)
         {
            this.chainedSecurityErrorHandler(param1);
         }
      }
   }
}
