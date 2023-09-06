package package_308
{
   import package_307.class_1776;
   import package_310.class_1780;
   import package_369.class_2115;
   import package_369.class_2116;
   import package_387.class_2247;
   import package_387.class_2248;
   
   public class class_1777 extends class_1776 implements class_1773
   {
       
      
      protected var var_3034:class_2248;
      
      private var var_3380:Vector.<class_1780>;
      
      protected var var_760:class_2247;
      
      public function class_1777()
      {
         this.var_3380 = new Vector.<class_1780>();
         super();
         repeat = true;
         addMethod(this.var_760 = new class_2247());
         addMethod(this.var_3034 = new class_2248());
      }
      
      public function addDynamicMethod(param1:class_1780) : void
      {
         addMethod(param1);
         this.var_3380.push(param1);
      }
      
      public function removeDynamicMethod(param1:class_1780) : void
      {
         var _loc2_:int = int(this.var_3380.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_3380.splice(_loc2_,1);
         }
         super.method_804(param1);
      }
      
      public function removeDynamicMethods() : void
      {
         while(this.var_3380.length)
         {
            super.method_804(this.var_3380.pop());
         }
      }
      
      public function get alphaMask() : class_2115
      {
         return this.var_760.texture;
      }
      
      public function set alphaMask(param1:class_2115) : void
      {
         this.var_760.texture = param1 as class_2116;
      }
      
      public function get glowMap() : class_2115
      {
         return this.var_3034.texture;
      }
      
      public function set glowMap(param1:class_2115) : void
      {
         this.var_3034.texture = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
