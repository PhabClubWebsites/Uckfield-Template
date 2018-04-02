module PagesHelper
   
   def prev_page_button
      return "<i class='fa fa-angle-left'></i> 
        Previous".html_safe
   end
   
   def next_page_button
      return "Next
        <i class='fa fa-angle-right'></i>".html_safe
   end
end