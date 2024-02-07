# README

# disruptive-test
Steps to Install
- Set the DB with postgres
- run "rake db:seed"

Things to take into consideration
- The CoinAPI sometimes returns nil due to its limitation for constant consultations so if you create multiple Investments in a short period of time, most probably you will get nothing from the CoinAPI, this case is handle
- Once a Investment is created, it will create coin_instances associated to the Investment, these coin_instances will hold some relevant data from the CoinAPI and the calculations made with it so in case we want to check past investments made, we can do it without consulting the API
- If multiple Investments are made in a short period of time, the CoinAPI will most probably return nil and the application won't create the coin_instances so we won't have any data to display
- If we go to the investment show view and no coin_instances were created previously, in the background, it will try to consult the API to create the coin_instances, there will be 3 attemps to do this, if all of these attemps fail we will just display a message stating that the API is not working at the momment

Test cases were made with RSPec


