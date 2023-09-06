package net.bigpoint.darkorbit.mvc.gui.highlights.model
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;
   import net.bigpoint.darkorbit.mvc.gui.highlights.view.IHighLighter;
   import net.bigpoint.darkorbit.mvc.gui.highlights.view.IHighlightActivate;
   
   public class HighlightProxy extends DOAbstractProxy
   {
      
      public static const NAME:String = "HighlightProxy";
       
      
      public function HighlightProxy()
      {
         super(NAME,new Dictionary());
      }
      
      private function get rootlookup() : Dictionary
      {
         return data as Dictionary;
      }
      
      public function addHighlightToLookup(param1:IHighLighter) : void
      {
         var _loc2_:Dictionary = this.getSourceLookup(param1.vo.source);
         var _loc3_:Vector.<IHighLighter> = _loc2_[param1.vo.itemId] as Vector.<IHighLighter>;
         if(_loc3_)
         {
            this.removeHighlightInListByType(_loc3_,param1.vo.highlighterType);
         }
         else
         {
            _loc3_ = new Vector.<IHighLighter>();
            _loc2_[param1.vo.itemId] = _loc3_;
         }
         _loc3_.push(param1);
      }
      
      private function getSourceLookup(param1:String) : Dictionary
      {
         var _loc2_:Dictionary = this.rootlookup[param1];
         if(!_loc2_)
         {
            _loc2_ = new Dictionary();
            this.rootlookup[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function hasHighlighterOfType(param1:HighlightItemVO) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:Dictionary = this.getSourceLookup(param1.source);
         if(_loc2_)
         {
            _loc3_ = _loc2_[param1.itemId] as Vector.<IHighLighter>;
            if(_loc3_)
            {
               return this.doesListContainHighlighterByType(_loc3_,param1.highlighterType);
            }
            return false;
         }
         return false;
      }
      
      private function doesListContainHighlighterByType(param1:Vector.<IHighLighter>, param2:int) : Boolean
      {
         var _loc5_:* = null;
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1[_loc4_].vo.highlighterType == param2)
            {
               if(_loc5_ = param1[_loc4_] as IHighlightActivate)
               {
                  return _loc5_.isRunning();
               }
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      public function getAllHighlightersByVo(param1:HighlightItemVO) : Vector.<IHighLighter>
      {
         var _loc2_:Dictionary = this.getSourceLookup(param1.source);
         return _loc2_[param1.itemId] as Vector.<IHighLighter>;
      }
      
      public function removeAllHighlightersByVo(param1:HighlightItemVO) : void
      {
         var _loc2_:Dictionary = this.getSourceLookup(param1.source);
         var _loc3_:Vector.<IHighLighter> = _loc2_[param1.itemId] as Vector.<IHighLighter>;
         if(_loc3_)
         {
            this.removeAllHighlightInList(_loc3_);
         }
         delete _loc2_[param1.itemId];
      }
      
      public function removeHighlighterByVoAndType(param1:HighlightItemVO) : void
      {
         var _loc2_:Dictionary = this.getSourceLookup(param1.source);
         var _loc3_:Vector.<IHighLighter> = _loc2_[param1.itemId] as Vector.<IHighLighter>;
         if(_loc3_)
         {
            this.removeHighlightInListByType(_loc3_,param1.highlighterType);
         }
      }
      
      private function removeAllHighlightInList(param1:Vector.<IHighLighter>) : void
      {
         var _loc2_:Number = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1[_loc3_].remove();
            _loc3_++;
         }
         param1.length = 0;
      }
      
      private function removeHighlightInListByType(param1:Vector.<IHighLighter>, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:Number = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = param1[_loc5_]).vo.highlighterType == param2)
            {
               _loc4_.remove();
               param1.splice(_loc5_,1);
            }
            _loc5_++;
         }
      }
      
      public function removeAllHighlightersByCategory(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:Dictionary = this.getSourceLookup(param1);
         for each(_loc3_ in _loc2_)
         {
            this.removeAllHighlightInList(_loc3_);
         }
      }
      
      public function removeAllHighlightersByItem(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in this.rootlookup)
         {
            _loc3_ = _loc2_[param1] as Vector.<IHighLighter>;
            if(_loc3_)
            {
               this.removeAllHighlightInList(_loc3_);
            }
         }
      }
   }
}
