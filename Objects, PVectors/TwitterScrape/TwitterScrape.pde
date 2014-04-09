//you have to sign up for your own keys 

//Oauth info
static String OAuthConsumerKey = "YLYsc3WkrUc8zJpidXcnw";
static String OAuthConsumerSecret = "mEwWTHf2nbA01HCysg8llFE9Z3f7lbBsMhbuDVBT6g";

//Access Token info
static String AccessToken = "372054045-7KAICklwZmhsjx6jj7Is7VSIYhXA6Xbu4VxU1JSm";
static String AccessTokenSecret = "h22GG2h0PI0eVaxdIzIl5xLr8659BxzZtmxpXHmXjyKww";

//Filter these keywords
String keywords[] = {
  "brain"
};

TwitterStream twitter = new TwitterStreamFactory().getInstance();

void setup() {
  connectTwitter();
  twitter.addListener(listener);
  twitter.filter(new FilterQuery().track(keywords));
}

void draw() {
}

// Initial connection
void connectTwitter() {
  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);
}

// Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}

// This listens for new tweet
StatusListener listener = new StatusListener() {
  public void onStatus(Status status) {
  println(status.getText());
  }

  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    //  System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
  public void onScrubGeo(long userId, long upToStatusId) {
    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }

  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};

