package package_90
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_188.WordPuzzleProxy;
   import package_189.class_1116;
   
   public class class_1117 extends SimpleCommand
   {
       
      
      public function class_1117()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_1116 = param1.getBody() as class_1116;
         var _loc3_:WordPuzzleProxy = facade.retrieveProxy(WordPuzzleProxy.NAME) as WordPuzzleProxy;
         _loc3_.method_5354(_loc2_);
      }
   }
}
