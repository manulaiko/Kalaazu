package net.bigpoint.darkorbit.gui
{
   import mx.utils.StringUtil;
   
   public class class_226
   {
       
      
      private var message:String;
      
      private var completed:Boolean;
      
      private var var_1430:int;
      
      public function class_226(param1:String)
      {
         super();
         this.message = StringUtil.trim(param1);
      }
      
      public function method_2051() : Boolean
      {
         if(this.var_1430 == this.message.length)
         {
            this.completed = true;
         }
         return this.completed;
      }
      
      public function method_3393() : String
      {
         return this.message;
      }
      
      public function method_2021(param1:int) : String
      {
         var _loc2_:int = Number(this.message.length) - Number(this.var_1430);
         var _loc3_:int = _loc2_ >= param1 ? param1 : _loc2_;
         this.var_1430 += _loc3_;
         return this.message.substring(0,this.var_1430) + "_";
      }
   }
}
