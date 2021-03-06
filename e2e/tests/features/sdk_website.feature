Feature: Protect and Track Demo Site
  As an end user,
  I want to use Protect and Track Demo site to encrypt various types of files

  # Scenarios can be highly declarative, which focuses on behavior.
  # Don't get caught up in button names and layouts at the Gherkin level.
  # Note that these scenarios use Selenium WebDriver to do browser interactions.

  # for every Then assertion, we require a case_id, which is TestRail Case ID
  # https://virtru.testrail.net/index.php?/dashboard
  # Talk to QA Leads before you create Test Cases in TestRail

  Background:
    Given Project is protect-and-track-demo

  @smoke @regression
  Scenario: Send TDF3 attachment in BP
    Given a TDF3 file: tdf3.pdf.tdf
    When I start to run testrail 255257
    And I logged in gmail page as qavirtrumd11@cmk-test-org.com using a new browser with BP activated
    And I composed an email to qavirtrumd12@cmk-test-org.com
    And I turned on secure toggle
    And I input tdf3 attachment test as email subject in gmail page
    And I input tdf3 attachment test as email body in gmail page
    And I drag and drop the file in gmail page
    And I clicked send securely button in gmail page and wait for complete
    And I logged in gmail page as qavirtrumd12@cmk-test-org.com using the same browser with BP activated
    And I opened this email in gmail page
    Then this email is decrypted in gmail and contents are correct

  @smoke @regression
  Scenario Outline: Encrypt file in Protect and Track demo site
    Given an attachment file: sample.pdf
    When I start to run testrail 248592
    And I opened protect-and-track page using a new browser
    And I drag and drop the file in protect-and-track page
    And I grant access to blackhatmanager@gmail.com in protect-and-track page
    And I grant access to qavirtru31@cmk-test-org.com in protect-and-track page
    And I sign in as blackhatmanager@gmail.com to protect
    Then the file should be encrypted

