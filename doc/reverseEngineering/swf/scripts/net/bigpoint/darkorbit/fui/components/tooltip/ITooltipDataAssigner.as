package net.bigpoint.darkorbit.fui.components.tooltip
{
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.data.IDataReceptible;
   
   public interface ITooltipDataAssigner extends IDataReceptible
   {
       
      
      function set target(param1:Coreponent) : void;
      
      function hasTarget() : Boolean;
      
      function assign() : void;
   }
}
