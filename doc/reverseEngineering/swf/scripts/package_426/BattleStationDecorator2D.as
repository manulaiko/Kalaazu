package package_426
{
   import com.bigpoint.utils.class_1469;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStation;
   import package_113.class_310;
   import package_289.class_2366;
   import package_359.class_2082;
   import package_359.class_2364;
   
   public class BattleStationDecorator2D implements class_2366, IDisposable
   {
      
      private static const SHIELD:String = "shield";
      
      private static const HULL:String = "hull";
      
      private static const const_2393:String = "faction";
       
      
      private var var_176:class_306;
      
      private var var_127:class_2082;
      
      private var var_415:ReskeyMap;
      
      public function BattleStationDecorator2D()
      {
         super();
      }
      
      public function method_1804(param1:class_306, param2:class_2082, param3:Object) : void
      {
         this.var_127 = param2;
         this.var_176 = param1;
         this.var_415 = new ReskeyMap(param2.descriptor);
         this.battleStation.changed.add(this.method_2175);
         this.method_2175();
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.battleStation.changed.remove(this.method_2175);
         this.var_176 = null;
         this.var_127 = null;
         this.var_415 = null;
      }
      
      private function method_2175() : void
      {
         this.reload(HULL,Number(this.battleStation.hullExpansion) / 5 - 1);
         this.reload(SHIELD,Number(this.battleStation.deflectorShildExpansion) / 5 - 1);
         this.reload(const_2393,(this.battleStation.method_1954(class_310) as class_310).factionID.value);
      }
      
      private function reload(param1:String, param2:int) : void
      {
         var _loc3_:class_1469 = this.var_415.getResKey(param1,param2);
         this.getViewById(param1).load(_loc3_.right,_loc3_.left);
      }
      
      private function get battleStation() : BattleStation
      {
         return this.var_176.owner as BattleStation;
      }
      
      private function getViewById(param1:String) : class_2364
      {
         return this.var_127.method_4434(param1) as class_2364;
      }
   }
}

import com.bigpoint.utils.class_1469;

class ReskeyMap
{
    
   
   private var _descriptor:XML;
   
   function ReskeyMap(param1:XML)
   {
      super();
      this._descriptor = param1;
   }
   
   public function getResKey(param1:String, param2:int) : class_1469
   {
      var _loc4_:* = null;
      var _loc3_:XMLList = this._descriptor.child(param1);
      for each(_loc4_ in _loc3_)
      {
         if(int(_loc4_.attribute("id")) == param2)
         {
            return new class_1469(_loc4_.attribute("resKey"),_loc4_.attribute("srcKey"));
         }
      }
      return new class_1469("","");
   }
}
