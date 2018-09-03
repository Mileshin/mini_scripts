BEGIN {
  counts = 0;
}

{
  if ( $6 == "module=Quotas," ) {
    split(substr($18,7), a, "/")
    if ( a[2] <= a[1]){
      #print a[2] " " a[1]
      from=substr($10,6,length($10)-6);
      for(i=0; i<counts; i++){
        if (emails[i] == from) {
          break;
        }
      }
      # print counts " " i " " from
      if (i >= counts) {
        emails[counts] = from
        counts ++
      }
    }
  }

}

END {
  if ( counts > 0 ) {
    message = "From: quotaextended@example.com"
    message = message "\n" "To: admin@example.com"
    message = message "\nSubject: The quota exceeded"
    message = message "\n" "The quota exceeded " counts " users\n"\
              "This users have exceeded the quota:"
    for(i=0; i<counts; i++){
        message = message "\n" emails[i]
    }
    system("echo '" message "' | sendmail -f quotaextended@example.com -r quotaextended@example.com -t admin@example.com")
  }
}
