package net.bigpoint.darkorbit.fui.builder
{
   import flash.display.DisplayObjectContainer;
   import net.bigpoint.darkorbit.fui.builder.repository.IUITemplateRepository;
   
   public interface IUIBuilder
   {
       
      
      function build(param1:Object, param2:DisplayObjectContainer = null, param3:Boolean = false, param4:Boolean = false, param5:Function = null) : void;
      
      function getTemplateRepository(param1:String = null) : IUITemplateRepository;
   }
}
