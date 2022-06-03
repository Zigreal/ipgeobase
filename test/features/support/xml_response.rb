# frozen_string_literal: true

VALID_RESPONSE =
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" \
  "<query>\n" \
  "  <status>success</status>\n" \
  "  <country>United States</country>\n" \
  "  <countryCode>US</countryCode>\n" \
  "  <region>VA</region>\n" \
  "  <regionName>Virginia</regionName>\n" \
  "  <city>Ashburn</city>\n" \
  "  <zip>20149</zip>\n" \
  "  <lat>39.03</lat>\n" \
  "  <lon>-77.5</lon>\n" \
  "  <timezone>America/New_York</timezone>\n" \
  "  <isp>Google LLC</isp>\n" \
  "  <org>Google Public DNS</org>\n" \
  "  <as>AS15169 Google LLC</as>\n" \
  "  <query>8.8.8.8</query>\n" \
  "</query>"

RESPONSE_FOR_EMPTY_IP =
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" \
  "<query>\n" \
  "  <status>success</status>\n" \
  "  <country>Russia</country>\n" \
  "  <countryCode>Ru</countryCode>\n" \
  "  <region>MOW</region>\n" \
  "  <regionName>Moscow</regionName>\n" \
  "  <city>Moscow</city>\n" \
  "  <zip>104015</zip>\n" \
  "  <lat>55.7483</lat>\n" \
  "  <lon>37.6171</lon>\n" \
  "  <timezone>Europe/Moscow</timezone>\n" \
  "  <isp>Moscow Local Telephone Network (PJSC MGTS)</isp>\n" \
  "  <org>Pjsc Mgts)</org>\n" \
  "  <as>AS25513 PJSC Moscow city telephone network</as>\n" \
  "  <query>46.138.21.18</query>\n" \
  "</query>"
