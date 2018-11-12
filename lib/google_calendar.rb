module GoogleCalendar
  
  @calendar_id = 'jha.kkumar@gmail.com'
  
  def self.client_options
    {
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: 'http://localhost:3000/callback'
    }
  end
  
  def self.new_event(auth_session, title)
    client = Signet::OAuth2::Client.new(self.client_options)
    client.update!(auth_session)
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    today = Date.today

    event = Google::Apis::CalendarV3::Event.new({
      start: Google::Apis::CalendarV3::EventDateTime.new(date: today),
      end: Google::Apis::CalendarV3::EventDateTime.new(date: today + 1),
      summary: title
    })
  
    evt = service.insert_event(@calendar_id, event)
    
    return evt.id, evt.i_cal_uid
    
  end
  
  def self.update_event(auth_session, event_id, title)
    client = Signet::OAuth2::Client.new(self.client_options)
    client.update!(auth_session)
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    
    event = service.get_event(@calendar_id, event_id)
    
    event.summary = title
    
    service.update_event(@calendar_id, event_id, event)
    
  end
  
  def self.delete_event(auth_session, event_id)
    client = Signet::OAuth2::Client.new(self.client_options)
    client.update!(auth_session)
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    
    service.delete_event(@calendar_id, event_id)
    
  end
  

  
  
end