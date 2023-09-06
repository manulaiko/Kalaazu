package net.bigpoint.darkorbit.mvc.gui.highlights.model
{
   public class HighlightItemVO
   {
      
      private static const HIGHLIGHT_DURATION:Number = 1;
       
      
      private var _itemId:String;
      
      private var _source:String;
      
      private var _highlightDuration:Number;
      
      private var _highlighterType:int;
      
      private var _displayTime:Number;
      
      public function HighlightItemVO(param1:String, param2:String, param3:int, param4:Number = 0, param5:Number = 0)
      {
         super();
         this._highlighterType = param3;
         this._itemId = param1;
         this._source = param2;
         this._highlightDuration = param4 || HIGHLIGHT_DURATION;
         this._displayTime = param5;
      }
      
      public function get itemId() : String
      {
         return this._itemId;
      }
      
      public function get source() : String
      {
         return this._source;
      }
      
      public function get highlightDuration() : Number
      {
         return this._highlightDuration;
      }
      
      public function get highlighterType() : int
      {
         return this._highlighterType;
      }
      
      public function get displayTime() : Number
      {
         return this._displayTime;
      }
      
      public function clone() : HighlightItemVO
      {
         return new HighlightItemVO(this._itemId,this._source,this._highlighterType,this._highlightDuration,this._displayTime);
      }
   }
}
