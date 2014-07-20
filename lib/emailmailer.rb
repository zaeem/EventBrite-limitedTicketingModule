module EmailMailer
  require 'mandrill'

  def send_email(subject, text, filename, params)
    m = Mandrill::API.new
    message = {
      :subject => subject,
      :from_name => 'Slicket Ticket',
      :text => text,
      :to =>[{
         :email => params[:email],
         :name => params[:first_name] + ' ' + params[:last_name]
       }
     ],
     :html => render_to_string(:file => 'email_templates/' + filename,
                               :locals => {:@params => params},
                               :layout => false),
     :from_email => 'no-reply@slicket.com'
    }
    if m.messages.send message
      {:status => 'Success'}
    else
      errors = [:message => 'Email unable to be sent.']
      {:status => 'Unsuccessful', :errorMessageList => errors}
    end
  end
end