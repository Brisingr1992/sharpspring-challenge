class NoteMailer < ApplicationMailer
  def send_note(note, user)
    @user = user
    @note = note
    mail(to: @user.email, subject: 'Your recent note')
  end
end
