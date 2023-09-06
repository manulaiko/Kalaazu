package package_180
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_11.class_39;
   import package_22.class_198;
   import package_27.class_1007;
   import package_57.SoundToolMediator;
   import package_9.ResourceManager;
   
   public class class_1566 extends SimpleCommand
   {
       
      
      public function class_1566()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var mediator:SoundToolMediator = null;
         var notexistingStuff:Vector.<String> = null;
         var patterns:Array = null;
         var i:class_1007 = null;
         var finisher:class_39 = null;
         var j:String = null;
         var exists:Boolean = false;
         var notification:INotification = param1;
         super.execute(notification);
         mediator = facade.retrieveMediator(SoundToolMediator.NAME) as SoundToolMediator;
         try
         {
            mediator.method_4199();
            mediator.writeToLog("===TEST ALL THE SOUNDS===\n");
            notexistingStuff = new Vector.<String>();
            patterns = class_198.var_3286;
            for each(i in patterns)
            {
               finisher = ResourceManager.name_15.getFinisher(i.soundbank) as class_39;
               for each(j in i.resKeyList)
               {
                  exists = Boolean(finisher.hasEmbeddedObject(j));
                  if(!exists)
                  {
                     notexistingStuff.push("\n" + j + " in " + i.soundbank);
                  }
               }
            }
            mediator.writeToLog(notexistingStuff.length + " sounds are missing.\n");
            mediator.writeToLog("Missing sounds:\n " + notexistingStuff);
         }
         catch(error:Error)
         {
            mediator.method_4199();
            mediator.writeToLog("ZIPP ZIPP NIX LICHT! WARUM?\n");
            mediator.writeToLog(error.getStackTrace());
         }
      }
   }
}
