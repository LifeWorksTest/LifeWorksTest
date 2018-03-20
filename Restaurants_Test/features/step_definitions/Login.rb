require 'calabash-android/calabash_steps'

Given(/^the app has launched$/) do
    query("android.widget.LinearLayout id:'activity_login_environment_container'")
    def check_element_exists( query)
        if not element_exists( query )
          screenshot_and_raise "No element found for query: #{query}"                 
        end   
    end    
  end

Then(/^I change the API Environment to test$/) do    
    touch("android.widget.Spinner id:'activity_login_environment_spinner'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.CheckedTextView index:1")}
    touch("android.widget.CheckedTextView index:1")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.LinearLayout id:'activity_login_environment_container'")}
    expected_text = "test" #validates if the environmet is set to test or not
    actual_text = query("android.widget.TextView id:'text1'",:text).first
    unless expected_text == actual_text
      fail "Env  is incorrect. Expected '#{expected_text}', but got '#{actual_text}'."
    end    
end

Then(/^I tap on Login button$/) do
    touch("android.widget.TextView id:'activity_prelogin_button_login'")
end

Then(/^I enter username as "([^"]*)"$/) do |text|
  enter_text("android.widget.EditText",text)
end

Then(/^I enter wrong username "([^"]*)"$/) do |text|
  enter_text("android.widget.EditText",text)
end

Then(/^I tap continue button$/) do
    touch("android.widget.Button id:'activity_login_button_continue'")
end

Then(/^I enter password "([^"]*)"$/) do |text|
  enter_text("android.widget.EditText text:''",text)
  hide_soft_keyboard
end

Then(/^I tap Login button$/) do
    touch("android.widget.Button id:'activity_login_button_continue'")
end

Then(/^I see validation message for invalid user$/) do 
   wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView id:'snackbar_text' text:'Verify email address or password'")}   
   element_exists("android.widget.TextView id:'snackbar_text' text:'Verify email address or password'")
   puts "Entered wrong credentials"   
end


Then(/^I swipe till last walkthrough slide and press GOT IT$/) do
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView id:'view_walkthrough_confirm_text_view'")}
    3.times{flick_left()}    
    touch("android.widget.TextView id:'view_walkthrough_confirm_text_view'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView index:0")}
    expected_text = "News Feed" #validates if the user is on dashboard on successful login
    actual_text = query("android.widget.TextView index:0",:Text).first
    unless expected_text == actual_text       
      fail "Dashboard not displayed. Expected '#{expected_text}', but got '#{actual_text}'."
    else
        puts "user got logged in" 
    end    
end

Then(/^I tap Give Recognition$/) do
    touch("android.widget.TextView id:'card_feed_give_recognition_button'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView id:'action_selection_done'")}
    expected_text = "Next" #validates if the user is on select colleague(s) page
    actual_text = query("android.widget.TextView id:'action_selection_done'",:Text).first
    unless expected_text == actual_text       
      fail "select colleague(s) page not displayed. Expected '#{expected_text}', but got '#{actual_text}'."
    else
        puts "select colleague(s) page displayed" 
    end
  end
  
Then(/^I select user "([^"]*)"$/) do |arg1|
    touch("android.widget.TextView text:'Test User'")
    touch("android.widget.TextView id:'tooltip_title'") #to close tooltip   
end
  
Then(/^I tap on NEXT$/) do
    touch("android.widget.TextView id:'action_selection_done'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView id:'view_badge_list_item_title'")}
    expected_text = "Organised" #validates if the user is on select a badge page
    actual_text = query("android.widget.TextView id:'view_badge_list_item_title'",:Text).first
    unless expected_text == actual_text       
      fail "select a badge page not displayed. Expected '#{expected_text}', but got '#{actual_text}'."
    else
        puts "select a badge page displayed" 
    end
end
  
Then(/^I scroll down until I see "([^"]*)"$/) do |text|
  q = query("android.widget.TextView text:'#{text}'")
  while q.empty?
    perform_action('drag',50,50,50,20,20)
   q = query("android.widget.TextView text:'#{text}'")      
  end 
  
  end
  
Then(/^I tap on "([^"]*)" badge$/) do |text|
  wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView text:'#{text}'")}
  touch("android.widget.TextView text:'#{text}'")
end


Then(/^I enter text in description "([^"]*)"$/) do |arg1|
   touch("com.wam.android.widget.UserSuggestionsEditText id:'fragment_give_recognition_usersuggestion'")
   enter_text("com.wam.android.widget.UserSuggestionsEditText id:'fragment_give_recognition_usersuggestion'", arg1)
end
  
Then(/^I post the Recognition$/) do
    touch("android.widget.TextView id:'action_selection_done'")
end
  

Then(/^I check for the posted Recognition in newsfeed page$/) do
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView index:0")}
    expected_text = "He is a superstar!" #validates if the posted recognition is displayed on newsfeed page
    actual_text = query("android.widget.TextView id:'view_feed_recognition_secondary_text'",:Text).first
    unless expected_text == actual_text       
      fail "Recognition is not available. Expected '#{expected_text}', but got '#{actual_text}'."
    else
        puts "Recognition is available" 
    end
end

Then(/^I tap Perks in bottom navigation$/) do
    touch("android.widget.TextView text:'Perks'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView id:'menu_item_perks_home_wallet'")}
    expected_text = "Perks Home" #validates if the user is on perks home page
    actual_text = query("android.widget.TextView text:'Perks Home'",:Text).first
    unless expected_text == actual_text       
      fail "Perks home page is not displayed. Expected '#{expected_text}', but got '#{actual_text}'."
    else
        puts "Perks home page is displayed" 
    end
end
  
Then(/^I tap on Restaurants$/) do
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.Button id:'view_perks_segment_see_all'")}
    touch("android.widget.TextView id:'card_category_title' text:'Restaurants'")  
    expected_text = "Restaurants" #validates if the user is on Restaurants page
    actual_text = query("android.widget.TextView text:'Restaurants'",:Text).first
    unless expected_text == actual_text       
      fail "Restaurants page is not displayed. Expected '#{expected_text}', but got '#{actual_text}'."
    else
        puts "Restaurants page is displayed" 
    end

end

Then(/^I make second restaurant as favourite$/) do

    touch("android.widget.FrameLayout id:'card_view' index:1")
    touch("android.support.v7.widget.AppCompatImageButton id:'fragment_new_restaurant_details_favourite_button'")  
    
    q = query("android.widget.TextView id:'snackbar_text'",:Text)#will check if the restaurant is already a favourite or not
    if q == "Added to Favorites!"
      puts "Restaurant added to favourite"
    else
      touch("android.support.v7.widget.AppCompatImageButton id:'fragment_new_restaurant_details_favourite_button'")
      puts "Restaurant added to favourite now"
    end 
    press_button('KEYCODE_BACK')
end

Then(/^I logout$/) do
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView text:'Restaurants'")}
    press_button('KEYCODE_BACK')# will goes back to the perks page, selects more and clicks Logout button in settings page   
    touch("android.widget.TextView text:'More'")
    touch("android.widget.ImageView id:'fragment_more_settings_icon'")
    scroll("android.support.v7.widget.RecyclerView", :down)    
    touch("android.widget.TextView text:'Logout'")    
    touch("android.widget.Button index:1")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView id:'activity_prelogin_button_login'")}    
    expected_text = "Log in" #validates if the user is on Login page
    actual_text = query("android.widget.TextView id:'activity_prelogin_button_login'",:Text).first
    unless expected_text == actual_text       
      fail "logout failed. Expected '#{expected_text}', but got '#{actual_text}'."
    else
        puts "Logged out successfully" 
    end
    
end


