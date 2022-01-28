<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <img src="/screenshoot/screen1.png" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="/screenshoot/screen1.png" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="/screenshoot/screen1.png" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="/screenshoot/screen1.png" width="200"/>
            </td>
        </tr>
        <tr>
             <td style="text-align: center">
                 <img src="/screenshoot/screen1.png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/screenshoot/screen1.png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/screenshoot/screen1.png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/screenshoot/screen1.png" width="200"/>
             </td>
        </tr>  
    </table>
</div>

# ATM Simulator 📝

## About

it is replicate ATM machine. insert and get data from database using command line.

List command :

* login [name] - Logs in as this customer and creates the customer if not exist

* deposit [amount] - Deposits this amount to the logged in customer

* withdraw [amount] - Withdraws this amount from the logged in customer

* transfer [target] [amount]` - Transfers this amount from the logged in customer to the target customer

* logout - Logs out of the current customer

How to use ?

Login/register => login ali

Deposit => deposit 100

Withdraw => withdraw

Transfer => transfer budi 200

Logout => logout


## Directory Structure

    .
    ├── core                       # For all common and core files.
    │   ├── error                  # contains all Exceptions and Failures classes
    │   ├── usecases               # common presentation files
    │   └── util                   # common usecases
    |
    ├── feature                    # all features
        ├── atm                    # Feature 1 (for exp : Todo Feature)
            ├── data               # Data Files of Feature 1
            ├   └── datasources    # DataSources Abstract Files and Implementations
            ├   └── models         # Models for data
            ├   └── repositories   # Repositories Implementation Classes
            └── domain             # Domain
            ├   └── entities       # Entities For Feature 1
            ├   └── usecases       # Usecases of Feature 1
            ├   └── repositories   #   Repositories Abstract Classes
            ├── presentation       # Feature 1 presentation files
            │   └── blocs          # Feature 1 blocs
            │   └── pages          # Feature 1 pages

## Architecture

This app uses Clean Architecture.
