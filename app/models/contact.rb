class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "You have an Email from Phab #{club.club_name}",
      :to => club.club_email,
      :from => %("#{name}" <#{email}>)
    }
  end
end