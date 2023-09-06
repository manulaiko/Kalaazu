package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   import net.bigpoint.darkorbit.fui.components.text.input.Input;
   
   public class InputCreator extends AbstractCreator implements IXMLNodeCreator
   {
       
      
      public function InputCreator()
      {
         super();
      }
      
      public function create(param1:XML) : ICoreponent
      {
         var _loc2_:Input = new Input();
         mapXMLNodeAttributes(_loc2_,param1);
         return _loc2_;
      }
   }
}
