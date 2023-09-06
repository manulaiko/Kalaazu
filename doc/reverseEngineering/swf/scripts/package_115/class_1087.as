package package_115
{
   import com.bigpoint.utils.class_73;
   import package_22.class_167;
   
   public class class_1087 extends class_167
   {
       
      
      public var enginePositions:Vector.<Vector.<class_73>>;
      
      public var var_2183:Vector.<Vector.<class_73>>;
      
      public function class_1087(param1:int, param2:Array, param3:Array = null)
      {
         super(param1,class_167.const_2613);
         this.enginePositions = Vector.<Vector.<class_73>>(param2 || true);
         if(param3)
         {
            this.var_2183 = Vector.<Vector.<class_73>>(param3);
         }
      }
   }
}
