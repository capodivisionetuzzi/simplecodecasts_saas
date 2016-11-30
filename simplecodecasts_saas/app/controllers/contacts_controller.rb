class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            flash[:success] = "Message sent"
            redirect_to new_contact_path notice: "Abbiamo ricevuto il tuo messaggio."
        else
            flash[:danger] = "Error occured"
            redirect_to new_contact_path notice: "Si è verificato un errore."
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end