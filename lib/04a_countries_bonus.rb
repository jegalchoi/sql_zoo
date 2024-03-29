# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      gdp > (
        SELECT
          gdp
        FROM
          countries
        WHERE
          continent = 'Europe' AND gdp IS NOT NULL
        ORDER BY
          gdp DESC
        LIMIT
          1
      )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT
      max_area.continent,
      countries.name,
      max_area.a
    FROM
      countries
    JOIN
        (SELECT
          continent,
          MAX(area) a
        FROM
          countries
        GROUP BY
          continent) max_area ON countries.area = max_area.a
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT
          continent
        FROM
          countries
        GROUP BY
          continent
        ORDER BY
          continent DESC
          
          
        
        
  SQL
end
