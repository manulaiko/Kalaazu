package package_75
{
   import package_10.class_1173;
   import package_35.Effect;
   
   public class class_1815 extends Effect
   {
      
      public static const ID:int = 286;
       
      
      public const text:class_1173 = new class_1173();
      
      public function class_1815(param1:String = null)
      {
         super(ID,const_2311,null);
         this.text.value = param1;
      }
      
      override public function method_5571(param1:Effect) : void
      {
         this.text.value = (param1 as class_1815).text.value;
      }
   }
}
