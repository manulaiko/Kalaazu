package package_279
{
   import flash.events.Event;
   import package_113.class_405;
   import package_39.class_1053;
   
   public class class_2326 extends class_2323
   {
       
      
      private var var_176:class_405;
      
      private var var_2234:class_1053;
      
      public function class_2326(param1:class_405)
      {
         super();
         this.var_176 = param1;
         this.var_2234 = new class_1053(true);
         this.var_2234.y = -5;
         this.var_2234.var_2862 = 200;
         addChild(this.var_2234);
         this.update();
         addEventListener(Event.ADDED_TO_STAGE,this.handleAdded);
         addEventListener(Event.REMOVED_FROM_STAGE,this.handleRemoved);
      }
      
      private function handleRemoved(param1:Event) : void
      {
         this.var_176.const_1132.changed.remove(this.update);
         this.var_176.const_3151.changed.remove(this.update);
         this.var_176.name_91.changed.remove(this.update);
         this.var_176.name_50.changed.remove(this.update);
      }
      
      private function handleAdded(param1:Event) : void
      {
         this.var_176.const_1132.changed.add(this.update);
         this.var_176.const_3151.changed.add(this.update);
         this.var_176.name_91.changed.add(this.update);
         this.var_176.name_50.changed.add(this.update);
      }
      
      private function update() : void
      {
         this.var_2234.method_5272(this.var_176.name_91.value - 1,this.var_176.name_50.value - 1);
         this.var_2234.method_4656(this.var_176.const_1132.value,this.var_176.const_3151.value);
         sizeChanged.dispatch();
      }
   }
}
