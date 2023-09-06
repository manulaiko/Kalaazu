package package_126
{
   import package_22.class_168;
   
   public class class_1091 extends class_168
   {
       
      
      public var color:uint;
      
      public var alpha:Number;
      
      public var scale:Number;
      
      private var var_4662:String;
      
      public function class_1091(param1:int, param2:String, param3:uint, param4:Number, param5:Number, param6:String)
      {
         super(param1,param2);
         this.color = param3;
         this.alpha = param4;
         this.scale = param5;
         this.var_4662 = param6;
      }
      
      public function get resKey3D() : String
      {
         return this.var_4662;
      }
   }
}
