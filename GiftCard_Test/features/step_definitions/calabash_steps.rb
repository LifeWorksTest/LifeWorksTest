require 'calabash-android/calabash_steps'
Given(/^the app has launched$/) do# sets environment as test
   query("android.widget.LinearLayout id:'activity_login_environment_container'")
    def check_element_exists( query)
        if not element_exists( query )
          screenshot_and_raise "No element found for query: #{query}"                 
        end   
    end 
    puts "App launched"
  end
  
  Then(/^I change the API Environment to test$/) do
    touch("android.widget.Spinner id:'activity_login_environment_spinner'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.CheckedTextView index:1")}    
    touch("android.widget.CheckedTextView index:1")
  end
  
  Then(/^I tap on Login button$/) do
    touch("android.widget.TextView id:'activity_prelogin_button_login'")
    if element_exists("TextInputLayout id:'activity_login_email_or_username_container'")
        puts "in login page"
    end
  end
  
  Then(/^I enter username as "([^"]*)"$/) do |text|
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.EditText")} 
    enter_text("android.widget.EditText", text)
  end
  
  Then(/^I tap continue button$/) do
    touch("android.widget.Button id:'activity_login_button_continue'")
  end
  
  Then(/^I enter password "([^"]*)"$/) do |text|
    enter_text("android.widget.EditText text:''", text)
  end
  
  Then(/^I tap Login button$/) do
   touch("android.widget.Button id:'activity_login_button_continue'")
   #sleep(1)
   q = query("android.widget.TextView id:'view_walkthrough_cancel_text_view'")
   if q == false
    puts "not in Welcome page"
   else 
    puts "in Welcome page"
   end
  end

  Then(/^I tap on Skip button$/) do
    touch("android.widget.TextView id:'view_walkthrough_cancel_text_view'")
    if element_exists("android.widget.FrameLayout index:0")
      puts "in News Feed page"
     end
   end

   Then(/^I tap on New Post$/) do
    touch("android.widget.TextView id:'card_feed_give_recognition_new_post_button'")
    if element_exists("android.widget.ScrollView index:2")
      puts "in New Post page"
     end
   end

   Then(/^I enter post as "([^"]*)" and submit$/) do |text|# write & submits post
    enter_text("android.widget.EditText id:'fragment_compose_message_usersuggestions'", text)
    touch("android.widget.TextView id:'action_selection_post'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView text:'calabash testing!'")} 
    q = element_exists("android.widget.TextView text:'calabash testing!'")
   if q == true
    puts "post is added"
   else 
    puts "post not added"
   end
   end


   Then(/^I select Gift Cards from Perks$/) do
    touch("android.widget.TextView text:'Perks'")
    touch("android.widget.TextView text:'Gift Cards'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.support.v7.widget.RecyclerView")} 
    scroll("android.support.v7.widget.RecyclerView",:down)
    
  end
  
  Then(/^I select Marks & Spencer$/) do 
   touch("android.widget.FrameLayout id:'view_gift_card_item_container' index:4")
  end

  Then(/^I buy the gift card$/) do #opens gift card and buys selected gift card
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.Button id:'view_gift_card_details_confirm_button'")}
    touch("android.widget.Button id:'view_gift_card_details_confirm_button'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.EditText id:'view_credit_card_layout_card_number_edit_text'")}
    enter_text("android.widget.EditText id:'view_credit_card_layout_card_number_edit_text'",'4242424242424242')
    hide_soft_keyboard
    enter_text("android.widget.EditText id:'view_credit_card_layout_card_month_edit_text'",'03')
    enter_text("android.widget.EditText id:'view_credit_card_layout_card_year_edit_text'",'23')
    enter_text("android.widget.EditText id:'view_credit_card_layout_card_cvc_edit_text'",'123')
    hide_soft_keyboard
    touch("android.widget.Button id:'fragment_checkout_pay_button'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView id:'fragment_confirmation_title'")}
    q = element_exists("android.widget.TextView id:'fragment_confirmation_title'")
   if q == true
    puts "payment success"
   else 
    puts "payment not success"
   end
   end

   Then(/^I logout$/) do
    press_button('KEYCODE_BACK')# will logout from app
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.Button id:'view_gift_card_details_confirm_button'")}
    press_button('KEYCODE_BACK')
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


Then(/^I tap on Pay button without entering card details$/) do
  wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.Button id:'view_gift_card_details_confirm_button'")}
    touch("android.widget.Button id:'view_gift_card_details_confirm_button'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.EditText id:'view_credit_card_layout_card_number_edit_text'")}
    scroll("android.widget.FrameLayout id:'fragment_checkout_custom_view_container'", :down)
    touch("android.widget.Button id:'fragment_checkout_pay_button'")
    wait_for(:timeout => 30, :post_timeout => 1){element_exists("android.widget.TextView id:'view_credit_card_layout_card_number_error_text_view'")}
    cardq = element_exists("android.widget.TextView id:'view_credit_card_layout_card_number_error_text_view'")
    dateq = element_exists("android.widget.TextView id:'view_credit_card_layout_card_date_error_text_view'")
    cvvq = element_exists("android.widget.TextView id:'view_credit_card_layout_card_cvc_error_text_view'")
    if cardq==true
      puts "The card number is not a valid credit card number."
    elsif dateq==true
      puts "The card’s expiration year is invalid."
    elsif cvvq==true
      puts "The card’s security code is incorrect.."
    end
end
