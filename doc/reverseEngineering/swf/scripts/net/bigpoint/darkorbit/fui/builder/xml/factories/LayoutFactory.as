package net.bigpoint.darkorbit.fui.builder.xml.factories
{
   import net.bigpoint.darkorbit.fui.components.core.layout.AlignmentLayout;
   import net.bigpoint.darkorbit.fui.components.core.layout.HorizontalLayout;
   import net.bigpoint.darkorbit.fui.components.core.layout.ILayout;
   import net.bigpoint.darkorbit.fui.components.core.layout.NullLayout;
   import net.bigpoint.darkorbit.fui.components.core.layout.VerticalLayout;
   
   public class LayoutFactory
   {
      
      public static const LAYOUT_NULL:String = "null";
      
      public static const LAYOUT_RESIZE:String = "resize";
      
      public static const LAYOUT_VERTICAL:String = "vertical";
      
      public static const LAYOUT_HORIZONTAL:String = "horizontal";
       
      
      public function LayoutFactory()
      {
         super();
      }
      
      public static function create(param1:String) : ILayout
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case LAYOUT_VERTICAL:
               _loc2_ = new VerticalLayout();
               break;
            case LAYOUT_HORIZONTAL:
               _loc2_ = new HorizontalLayout();
               break;
            case LAYOUT_RESIZE:
               _loc2_ = new AlignmentLayout();
               break;
            default:
               _loc2_ = new NullLayout();
         }
         return _loc2_;
      }
   }
}
