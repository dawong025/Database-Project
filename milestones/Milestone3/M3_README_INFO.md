# **Milestone 3 Information**
## **[Student Name] Darren Wong**
## **[Student ID] 918565679**

### **[Discord Server Link]** https://discord.gg/3YsT5mkJun
### **[Repl Bot Invite Link]** https://replit.com/join/titlfjqygx-dawong15

## **[Commands]**

1. ```/find_accounts <floor_balance> <threshold_balance(no balance)>```\
   Find all the accounts at or above a specified balance, with an optional threshold balance\
e.g. ```/find_accounts 500 1000```\
     ```/find_accounts 200 500```\

2. ```/find_expiration <year>```
   Find cards with expiration dates at a given year
   ```e.g. /find_expiration 2022```

3. ```/find_machine_status <status_type>```
   Find all the machines with a given status
e.g. ```/find_machine_status "working"```
     ```/find_machine_status "not_working"```

4. ```/get_logins <date>```
   Get all the logins from a given date
e.g. ```/get_logins 2022-05-15```

5. ```/get_owners <bank_id>```
   Get all the owners that are linked to one bank
   ```/get_owners 4```

6. ```/get_verified_devices <general_user_id>```
   Get all the verified devices linked to one general user
e.g. ```/get_verified_devices 2```

7. ```/change_savings_balance <balance> <account_id>``` -OR- ```/change_checking_balance <balance> <account_id>```
   Update the balance of a savings OR checkings account
e.g. ```/change_savings_balance 4002 1```
     ```/change_checking_balance 402 2```

8. ```/average_balances <account_type>```
   Find the average balances of either checking or savings accounts types
e.g. ```/average_balances checking```
     ```/average_balances savings```

9. ```/get_languages```
   For each ATM Machine, list out all the languages it supports
e.g. ```/get_languages```

10. ```/get_notifications```
    For each verified device, list out its notifications
e.g. ```/get_notifications```

11. ```/get_owner_names```
    For each bank, list out the owners by name
e.g. ```/get_owner_names```

12. ```/get_verifications <date>```
    Get the list of verifications for bank accounts on a given date
e.g. ```/get_verifications 2022-05-17```

13. ```/get_contracts <bank_id>```
    For every affiliate, list out their contract with that bank
e.g. ```/get_contracts 2```

14. ```/bank_loan_terms <bank_id>```
    List out every loan's terms and conditions offered by a bank
    ```/bank_loan_terms 2```
  
15. ```/get_card_scanned <start_date> <end_date>```
    Find every card scanned from a certain timeframe
e.g. ```/get_card_scanned 2022-05-14 2022-05-15```

16. ```/find_devices <manufacturer_id>```
    Find all the devices made by a manufacturer and list when they were made
e.g. ```/find_devices 4```
  
## **[Business Rules/Requirements]**
1. Find all the accounts at or above a specified balance, with an optional threshold balance

2. Find cards with expiration dates at a given year

3. Find all the machines with a given status

4. Get all the logins from a given date

5. Get all the owners that are linked to one bank

6. Get all the verified devices linked to one general user

7. Update the balance of a bank account

8. Find the average balances of either checking or savings accounts types

9. For each ATM Machine, list out all the languages it supports

10. For each verified device, list out its notifications

11. For each bank, list out the owners by name

12. Get the list of verifications for bank accounts on a given date

13. For every affiliate, list out their contract with that bank

14. List out every loan's terms and conditions offered by a bank

15. Find every card scanned from a certain timeframe

16. Find all the devices made by a manufacturer and list when they were made
