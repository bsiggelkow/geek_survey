Feature: Surveys
  In order to survey my friends
  As a user
  I want to be able to create a survey

Background:
  Given the user is logged in

Scenario: Survey
  When the user creates a survey
  Then the survey should have a shortened url




  
