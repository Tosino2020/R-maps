
x<-c("choroplethr","choroplethrMaps","choroplethrAdmin1")

lapply(x,library,character.only=T)

?admin1.regions

###create chropleth using admin one level regions
data(df_japan_census)
head(df_japan_census)
df_japan_census$value=df_japan_census$pop_2010
admin1_choropleth("japan",df_japan_census,"2010 japan population estimates","Population")

###create country choropleth
data(df_pop_country)
country_choropleth(df_pop_country,"2010 world bank population estimates","Population",num_colors =7)

###county-level choropleth
data(df_pop_county)
county_choropleth(df_pop_county, title="US 2012 County Population Estimates", legend="Population")
county_choropleth(df_pop_county,title="US 2012 County Population Estimates",legend="Population",num_colors=7,state_zoom=c("california", "oregon", "washington"))

###state choropleth
data(df_pop_state)
state_choropleth(df_pop_state, title="US 2012 State Population Estimates", num_colors = 7,legend="Population")
