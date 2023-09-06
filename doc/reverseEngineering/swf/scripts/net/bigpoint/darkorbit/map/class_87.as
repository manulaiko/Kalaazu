package net.bigpoint.darkorbit.map
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_19.class_67;
   
   public interface class_87
   {
       
      
      function get ready() : class_67;
      
      function load(param1:class_90) : void;
      
      function method_3361(param1:int, param2:int) : void;
      
      function update(param1:int, param2:int, param3:Number) : void;
      
      function method_574(param1:int, param2:int, param3:class_73 = null) : class_73;
      
      function method_4683(param1:int, param2:int, param3:int = 0, param4:class_73 = null) : class_73;
      
      function zoomIn(param1:Number = 0.3) : void;
      
      function zoomOut(param1:Number = 0.3) : void;
      
      function method_70(param1:Number, param2:Number) : void;
      
      function get zoom() : Number;
      
      function dispose() : void;
      
      function method_1164(param1:class_80) : void;
      
      function method_3592(param1:class_80) : void;
      
      function get method_3826() : uint;
   }
}
