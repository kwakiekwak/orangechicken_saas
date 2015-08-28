class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end
    
    def create
      @contact = Contact.new(contact_params)
      
      if @contact.save
        #commiting to the database(saving)
        #if true "message sent"
        #else "error has occured"
        flash[:danger] = "Message sent."
        redirect_to new_contact_path
      else
        flash[:error] = "Error occured, message has not been sent"
        redirect_to new_contact_path
      end
    end
    
    private
      def contact_params
        params.require(:contact).permit(:name, :email, :comments)
      end
      # white list def to end ^
end

# steps
# 1. Web server(Webrick) catches HTTP request and notifies Routes.rb ->config
# 2. Routes.rb tells Contacts_Controller.rb -> controllers/concerns to run the 'new' action
# 3. Contacts_Controller.rb checks Views folder for HTML file with same 'new' name (new.html.erb)
# 4. Contacts_Controller.rb 'new' action sets a variable called @contact for use in the New.html.erb view file
# 5. Contacts_Controller.rb sends all gathered HTML back to webrick
# 6. Webrick sends back HTTP response containing all necessary HTML for the browser to render the page
