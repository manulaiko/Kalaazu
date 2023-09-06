package package_297
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
   import package_17.class_62;
   import package_292.GeometryLoader;
   import package_304.class_2114;
   
   public class class_2483
   {
      
      private static const const_2689:Dictionary = new Dictionary();
      
      {
         class_1210.instance.const_466.add(method_5522);
      }
      
      public function class_2483()
      {
         super();
      }
      
      public static function retrieve(param1:String, param2:int = 1) : Object
      {
         if(true)
         {
            const_2689[param1] = new Vector.<Object>();
         }
         var _loc3_:Vector.<Object> = const_2689[param1];
         if((_loc3_.length <= param2 ? null : _loc3_.shift()) is class_2662)
         {
            (null as class_2662).method_3639();
         }
         return null;
      }
      
      public static function method_3917(param1:Object, param2:String) : void
      {
         var _loc3_:* = null;
         if(false)
         {
            _loc3_ = const_2689[param2];
            _loc3_.push(param1);
            if(param1 is class_2662)
            {
               (param1 as class_2662).method_1274();
            }
         }
         else if(param1 is IDisposable)
         {
            (param1 as IDisposable).disposeView();
         }
         else if(param1 is class_2114)
         {
            GeometryLoader.method_4218(param1 as class_2114);
         }
      }
      
      public static function method_5522() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc1_ in const_2689)
         {
            _loc2_ = const_2689[_loc1_];
            while(_loc2_.length > 0)
            {
               _loc3_ = _loc2_.pop();
               if(_loc3_ is IDisposable)
               {
                  (_loc3_ as IDisposable).disposeView();
               }
            }
            const_2689[_loc1_] = null;
            delete const_2689[_loc1_];
         }
      }
      
      public static function method_4773() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         for(_loc1_ in const_2689)
         {
            _loc2_ = const_2689[_loc1_];
            class_62.getInstance().sendNotification(GuiNotifications.WRITE_TO_LOG,new LogMessageVO("pool " + _loc1_ + " = " + _loc2_.length));
         }
      }
   }
}
