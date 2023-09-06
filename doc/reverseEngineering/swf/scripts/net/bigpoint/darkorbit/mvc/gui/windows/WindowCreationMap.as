package net.bigpoint.darkorbit.mvc.gui.windows
{
   import flash.utils.Dictionary;
   import package_46.class_131;
   
   public class WindowCreationMap
   {
      
      private static const DEFAULT_VO_NAME:String = "defaultVOName";
       
      
      private var map:Dictionary;
      
      public function WindowCreationMap()
      {
         this.map = new Dictionary();
         super();
         this.initialize();
      }
      
      private function initialize() : void
      {
         this.map[DEFAULT_VO_NAME] = new WindowCreationVO(class_131);
      }
      
      public function getVO(param1:String) : WindowCreationVO
      {
         var _loc2_:WindowCreationVO = this.map[param1] as WindowCreationVO;
         if(_loc2_ == null)
         {
            _loc2_ = this.getDefaultVO();
         }
         return _loc2_;
      }
      
      protected function getDefaultVO() : WindowCreationVO
      {
         return this.map[DEFAULT_VO_NAME];
      }
   }
}
