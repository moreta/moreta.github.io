
# Unicorn, Passenger 5, and Puma Feature Comparison

cate                  | UNICORN     | PUMA        | PASSENGER 5
----------------------|-------------|-------------|--------------------
Clustering            | Yes         | Yes         | Yes
Multithreaded         | No          | Yes         | Enterprise Only
Slow client buffering | No          | Yes         | Yes
ActionCable           | Yes         | Yes         | Yes
Support               | Open Source | Open Source | Open Source / Paid
Installation          | Gem         | Gem         | Binary or Gem
Zero-Downtime Deploys | Yes         | Yes         | Enterprise

* passengerでzero-downtime deployが enterpriseなのはしらなかった