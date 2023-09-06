package package_90
{
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_188.WordPuzzleProxy;
   import package_189.class_1116;
   import package_46.class_131;
   import package_53.class_1115;
   import package_53.class_146;
   import package_85.class_244;
   
   public class class_250 extends SimpleCommand
   {
       
      
      public function class_250()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         super.execute(param1);
         var _loc4_:class_1116 = param1.getBody() as class_1116;
         if(!facade.hasMediator(class_1115.NAME))
         {
            _loc6_ = (_loc5_ = class_58.instance).createWindow(GuiConstants.WORD_PUZZLE_WINDOW) as class_131;
            _loc8_ = (_loc7_ = class_57.getInstance()).method_1604(class_57.const_1955,_loc6_) as class_146;
            _loc2_ = new class_1115(_loc8_);
            facade.registerMediator(_loc2_);
         }
         if(!facade.hasProxy(WordPuzzleProxy.NAME))
         {
            _loc3_ = new WordPuzzleProxy();
            facade.registerProxy(_loc3_);
         }
         else
         {
            _loc3_ = facade.retrieveProxy(WordPuzzleProxy.NAME) as WordPuzzleProxy;
         }
         _loc3_.method_4670(_loc4_.var_2131);
         if(!facade.hasCommand(class_244.const_2065))
         {
            facade.registerCommand(class_244.const_2065,class_1117);
         }
      }
   }
}
