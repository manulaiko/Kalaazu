package net.bigpoint.darkorbit.fui.components.buttons.radio
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class RadioButtonGroupManager extends EventDispatcher
   {
      
      private static var _instance:RadioButtonGroupManager;
       
      
      private var _groups:Dictionary;
      
      public function RadioButtonGroupManager()
      {
         this._groups = new Dictionary();
         super();
      }
      
      public static function getInstance() : RadioButtonGroupManager
      {
         if(_instance == null)
         {
            _instance = new RadioButtonGroupManager();
         }
         return _instance;
      }
      
      public function register(param1:String, param2:RadioButton) : void
      {
         if(this._groups[param1] == null)
         {
            this._groups[param1] = new RadioButtonGroup();
         }
         var _loc3_:RadioButtonGroup = this._groups[param1];
         _loc3_.add(param2);
      }
      
      public function unregister(param1:String, param2:RadioButton) : void
      {
         var _loc3_:* = null;
         if(this._groups[param1])
         {
            _loc3_ = this._groups[param1];
            _loc3_.remove(param2);
         }
      }
      
      public function getGroup(param1:String) : RadioButtonGroup
      {
         return this._groups[param1];
      }
   }
}
