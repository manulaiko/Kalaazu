package package_18
{
   import package_11.class_39;
   import package_23.FileCollectionFileLoadEvent;
   import package_9.ResourceManager;
   
   public class class_64
   {
       
      
      public var callbackCompleteList:Array;
      
      public var callbackErrorList:Array;
      
      public var isLoaded:Boolean = false;
      
      private var _inProgress:Boolean = false;
      
      private var resKey:String;
      
      public function class_64(param1:String, param2:Function, param3:Function)
      {
         this.callbackCompleteList = [];
         this.callbackErrorList = [];
         super();
         this.resKey = param1;
         this.addCompleteCallback(param2);
         this.addErrorCallback(param3);
      }
      
      public function load() : void
      {
         this._inProgress = true;
         if(!ResourceManager.name_15.isLoaded(this.resKey))
         {
            ResourceManager.name_15.load(this.resKey,this.assetLoaded,this.assetLoadError);
         }
      }
      
      public function assetLoaded(param1:class_39 = null) : void
      {
         this._inProgress = false;
         this.isLoaded = true;
         this.callAllCompleteCallbacks(param1);
      }
      
      public function assetLoadError(param1:FileCollectionFileLoadEvent = null) : void
      {
         this._inProgress = false;
         ResourceManager.method_6428(this.resKey);
         this.callAllErrorCallbacks();
      }
      
      public function callAllCompleteCallbacks(param1:class_39 = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.callbackCompleteList.length)
         {
            this.callbackCompleteList[_loc2_](param1);
            _loc2_++;
         }
         this.callbackCompleteList.length = 0;
      }
      
      public function callAllErrorCallbacks() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.callbackErrorList.length)
         {
            this.callbackErrorList[_loc1_]();
            _loc1_++;
         }
         this.callbackErrorList.length = 0;
      }
      
      public function addCompleteCallback(param1:Function) : void
      {
         this.callbackCompleteList.push(param1);
      }
      
      public function addErrorCallback(param1:Function) : void
      {
         this.callbackErrorList.push(param1);
      }
      
      public function get inProgress() : Boolean
      {
         return this._inProgress;
      }
   }
}
