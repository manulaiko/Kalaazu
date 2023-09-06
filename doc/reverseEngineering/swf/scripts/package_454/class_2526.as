package package_454
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import net.bigpoint.darkorbit.class_18;
   import package_30.class_219;
   import package_30.class_91;
   
   public class class_2526 extends class_91
   {
       
      
      private var var_3019:class_219;
      
      private var var_3968:DisplayObject;
      
      private var var_1040:DisplayObject;
      
      private var var_762:DisplayObject;
      
      private var var_977:class_73;
      
      private var var_4044:int;
      
      public function class_2526(param1:int = 0, param2:int = 0)
      {
         this.var_3968 = new Shape();
         this.var_1040 = new Shape();
         this.var_762 = new Shape();
         this.var_977 = new class_73();
         super(class_91.const_261);
         this.var_977.x = param1;
         this.var_977.y = param2;
         this.init();
      }
      
      private function init() : void
      {
         addChild(this.var_762);
         addChild(this.var_3968);
         addChild(this.var_1040);
         this.method_619();
      }
      
      private function method_619() : void
      {
         this.var_3019 = new class_219(width,40,class_18.const_1147);
         this.method_3823();
         addChild(this.var_3019);
      }
      
      private function method_3823() : void
      {
         this.var_3019.name_96 = width;
         this.var_3019.y = Number(this.var_4044) - Number(this.var_3019.textField.textHeight) * 0.5;
      }
      
      public function set method_5108(param1:DisplayObject) : void
      {
         var _loc2_:Boolean = Boolean(this.method_5856(this.var_3968,param1));
         if(_loc2_)
         {
            this.var_3968 = param1;
            this.method_3823();
         }
      }
      
      public function set method_852(param1:DisplayObject) : void
      {
         var _loc2_:Boolean = Boolean(this.method_5856(this.var_1040,param1));
         if(_loc2_)
         {
            this.var_1040 = param1;
            this.var_1040.alpha = 0;
            this.method_4419();
         }
         TweenMax.to(this.var_1040,1,{"alpha":1});
      }
      
      public function get method_852() : DisplayObject
      {
         return this.var_1040;
      }
      
      public function set background(param1:DisplayObject) : void
      {
         this.method_5856(this.var_762,param1);
         this.var_762 = param1;
      }
      
      public function set method_5835(param1:int) : void
      {
         if(param1 != this.var_977.x)
         {
            this.var_977.x = param1;
            this.method_122();
         }
      }
      
      public function set method_1302(param1:int) : void
      {
         if(param1 != this.var_977.y)
         {
            this.var_977.y = param1;
            this.method_4176();
         }
      }
      
      private function method_5856(param1:DisplayObject, param2:DisplayObject) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         param2 = Boolean(param2) && param2 != param1 ? param2 : null;
         if(param2)
         {
            if(Boolean(param1) && Boolean(param1.parent))
            {
               _loc3_ = param1.parent;
               _loc4_ = param1.parent.getChildIndex(param1);
               _loc3_.addChildAt(param2,_loc4_);
               _loc3_.removeChild(param1);
            }
         }
         return Boolean(param2);
      }
      
      private function method_4419() : void
      {
         this.method_122();
         this.method_4176();
      }
      
      private function method_4176() : void
      {
         this.var_1040.y = this.var_977.y;
      }
      
      private function method_122() : void
      {
         this.var_1040.x = this.var_977.x;
      }
      
      public function method_1746(param1:String) : void
      {
         this.var_3019.method_1455(param1);
         this.method_3823();
      }
      
      public function set method_3552(param1:int) : void
      {
         if(this.var_4044 != param1)
         {
            this.var_4044 = param1;
            this.method_3823();
         }
      }
   }
}
