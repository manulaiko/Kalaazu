package package_210
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.SectorControlLobbyWindow;
   import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.SectorControlLobbyWindowMediator;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_267.SectorControlProxy;
   import package_27.class_82;
   
   public class class_2310 extends AsyncCommand
   {
       
      
      public function class_2310()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.method_1454())
         {
            _loc2_ = class_57.getInstance().createWindow(class_57.const_3114,class_57.const_729) as SectorControlLobbyWindow;
            if(!facade.hasMediator(SectorControlLobbyWindowMediator.NAME))
            {
               _loc3_ = new SectorControlLobbyWindowMediator(_loc2_);
               facade.registerMediator(_loc3_);
            }
            else
            {
               (_loc4_ = facade.retrieveMediator(SectorControlLobbyWindowMediator.NAME) as SectorControlLobbyWindowMediator).setViewComponent(_loc2_);
            }
            class_82.playSoundEffect(class_126.const_1856);
         }
         commandComplete();
      }
      
      protected function method_1454() : Boolean
      {
         var _loc1_:SectorControlProxy = facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy;
         var _loc2_:uint = uint(_loc1_.minLevel);
         var _loc3_:uint = uint(_loc1_.name_119);
         var _loc4_:Number;
         return (_loc4_ = 0) >= _loc2_ && _loc4_ <= _loc3_ ? true : false;
      }
   }
}
