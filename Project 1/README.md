# Uncovering the World's Oldest Businesses

## Problem Statement
Entrepreneurship is an opportunity to boost job creation. However, most businesses fail in their first year of operation.This inspired an investigation into what businesses have stood the test of time and which industry is the most successful. 

## Tools
SQL,Power BI

## Dataset

Source: Kaggle- Uncovering the World’s Oldest Businesses(Information compiled by BusinessFinancing.co.uk ) 

The dataset contains four CSV files namely: businesses,categories,countries and new businesses.

### Data Dictionary

Businesses: There are 163 businesses from various countries which are identified by a unique country code and classified by a category code.

| Businesses table |                                                                                                    |           |
|:----------------:|:--------------------------------------------------------------------------------------------------:|:---------:|
| Column name      | Description                                                                                        | Data type |
| business         | The name of the business                                                                           | text      |
| year_founded     | The year when the business was established                                                         | int       |
| category_code    | A five character alpha-numeric code that identifies the category/industry the business belongs to. | text      |
| country_code     | A three character code that represents the country where the business operates.                    | text      |


Categories: It is a reference table containing 19 business categories/industries.

| Categories table |                                                                                            |           |
|:----------------:|:------------------------------------------------------------------------------------------:|:---------:|
| Column name      | Description                                                                                | Data type |
| category_code    | A five character alpha-numeric code that identifies the category  the business belongs to. | text      |
| category         |  The business category is uniquely identified by the category code.                        | text      |


Countries : The table contains 195 countries of the world , identified by a unique code and their respective continent .

| Countries table |                                                             |           |
|:---------------:|:-----------------------------------------------------------:|:---------:|
| Column name     | Description                                                 | Data type |
| country_code    | A three- letter code that uniquely identifies each country. | text      |
| country         | Country name                                                | text      |
| continent       | The continent that the country belongs to.                  | text      |


New businesses : It is a table with two new businesses,it has the same format as the businesses table.

| New Businesses table |                                                                                                    |           |
|:--------------------:|:--------------------------------------------------------------------------------------------------:|:---------:|
| Column name          | Description                                                                                        | Data type |
| business             | The name of the business                                                                           | text      |
| year_founded         | The year when the business was established                                                         | int       |
| category_code        | A five character alpha-numeric code that identifies the category/industry the business belongs to. | text      |
| country_code         | A three character code that represents the country where the business operates.                    | text      |


## Data cleaning and pre-processing

There were a few spelling errors in the following tables : 

1.Categories : ‘CafÃ©s,Restaurants & Bars’ - 'Cafes,Restaurants & Bars'

2.Countries: 'CÃ´te d'Ivoire' - 'Cote d'Ivoire'

3.New businesses: 'J. Armando BermÃºdez & Co.' - 'J. Armando Bermúdez & Co'

The errors were rectified using the UPDATE-SET statement.

Additionally,the information from the new businesses table was added to the businesses table using the UPDATE statement.

### SQL script : [The world's oldest businesses.sql](<The world's oldest businesses.sql>)


## EDA
1.The oldest company in the world and the industry it belongs to?

Kungo Gumi - Construction

2.The range of the founding years of the oldest companies in the world ?

579 AD - 1999

3.How many companies and which ones—were founded before 1000 AD?

There are six companies.

4.What are the oldest companies by continent?


  | Continent     | Business                    |
  |---------------|-----------------------------|
  | Africa        | Mauritius Post              |
  | Asia          | Kungo Gumi                  |
  | North America | La Casa de Moneda de Mexico |
  | South America | Casa Nacional de Moneda     |
  | Europe        | St. Peter Stifts Kulinarium |
  | Oceania       | Australia Post              |


5.Which century were most of these companies formed?

1900s. Between 1700s-1900s,there is an exponential increase in the number of businesses established in this period.

### Power BI visualisations:
![alt text](<Screenshot 2025-06-19 224132.png>)
![alt text](<Screenshot 2025-06-19 224528.png>)

Most of the businesses are operating in Africa, followed by Europe and Asia.
The reason is colonialism and the rise of European imperialism.

## Conclusion
Most businesses were established during the Industrial Revolution which occurred between 1700s and 1900s. This period is characterized by the shift of the economy from land to factories. Additionally, a lot of modern inventions were introduced such as the steam engine , which facilitated globalisation by creating transport networks.For the modern entrepreneur, a business that aligns with the current industrial revolution,4IR, can ensure longevity and success.
































