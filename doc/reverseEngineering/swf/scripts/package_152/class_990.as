package package_152
{
   import package_151.class_989;
   import package_151.class_995;
   
   public class class_990
   {
       
      
      private var _tabs:Vector.<class_995>;
      
      private var _rewards:class_989;
      
      private var _hint:String;
      
      public function class_990(param1:Vector.<class_995>, param2:class_989, param3:String)
      {
         super();
         this._hint = param3;
         this._rewards = param2;
         this._tabs = param1;
      }
      
      public function get method_6092() : Vector.<class_995>
      {
         return this._tabs;
      }
      
      public function get rewards() : class_989
      {
         return this._rewards;
      }
      
      public function get name_122() : String
      {
         return this._hint;
      }
   }
}
