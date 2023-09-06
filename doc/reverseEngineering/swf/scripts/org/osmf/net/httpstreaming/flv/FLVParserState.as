package org.osmf.net.httpstreaming.flv
{
   class FLVParserState
   {
      
      static const FILE_HEADER:String = "fileHeader";
      
      static const FILE_HEADER_REST:String = "fileHeaderRest";
      
      static const TYPE:String = "type";
      
      static const HEADER:String = "header";
      
      static const DATA:String = "data";
      
      static const PREV_TAG:String = "prevTag";
       
      
      function FLVParserState()
      {
         super();
      }
   }
}
