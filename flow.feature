1. An authenticated user creates a survey
2. System generates the survey and also creates a shortened url
3. That user may choose to tweet the survey
   "#{question} #{shortened_url} #geeksurvey"
   3.1 The twitter status id is saved with the survey (for matching up replies)
4. Followers may reply to the tweet with +1, -1, etc.
5. Others can log onto geeksurvey.com and give their opinion (no authentication required)

=== External processes ===
6. The system will periodically inspect any "mentions" tweets that came after the tweeted survey
  6.1. If the tweet was "in_reply_to" the survey question, the opinion is registered
7. The system will periodically post the current result of the survey as a status update
   This will include opinions from the website as well as tweet replies
8. The system will post the final result of the survey as a status update
  8.1 This implies that a survey has an expiration date/time
